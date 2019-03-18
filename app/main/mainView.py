# import sys
# sys.path.append("/home/noob/")
from flask import Flask, render_template, request
from flask import render_template
from app.main.dbapi import *
from app.main.DataAnalysis.Func.Recommendations import multiple_recommendation
from decimal import *
from datetime import timedelta
import app.main.FaceDetect.faceDetect as face
import base64
from sqlalchemy import extract
import json
import datetime
import decimal
# import pyOpenSSL


class DecimalEncoder(json.JSONEncoder):
    """
    处理decimal不能json序列化问题
    """
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            return float(o)
        super(DecimalEncoder, self).default(o)


app = Flask(__name__)
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = timedelta(seconds=1)
app.config['PERMANENT_SESSION_LIFETIME'] = timedelta(seconds=1)


@app.route('/')
def demo():
    return render_template("index.html")

'''
1.调用query_goods()查询商品信息
2.页面初始化返回返回商品信息给前台
3.return:goodInfo
    type:str
'''

@app.route('/init', methods=["GET", "POST"])
def init():
    #获取id,name,price字段
    u = [(good.good_id, good.name, good.price) for good in query_goods()]
    goodnum = len(u)
    testlist = []
    #数据库字段处理，拼接字符串
    for i in range(goodnum):
        testlist.append([])
        testlist[i].append(str(u[i][0]))
        testlist[i].append(u[i][1].replace(" ", ""))
        m = str(Decimal(u[i][2]).quantize(Decimal('0.0')))
        testlist[i].append(m)
    new=[]
    for i in range(goodnum):
        new.append(" ".join(testlist[i]))
    goodInfo = " ".join(new)
    if request.method == "POST":
        return (goodInfo)
    else:
        return render_template("login.html")

'''
1.保存照片到本地
2.上传并进行人脸检测
3.人脸检测返回值为user_info，为一个列表：
            如果找到了已经存在的用户，返回形如list[True,False,user_id,name,gender,age,phone_number]的列表
            如果图片中有多张人脸，则返回[True,True],提示重新拍照
            若没有找到则返回list[False,True,user_id],user_id为新创建的用户的id
            若检测失败(因为网络问题或者没有检测到人脸)，则返回list[False,False]
'''
@app.route('/upload', methods=['GET', 'POST'])
def upload_test():
    print('uploading!')
    # 获取图片文件并保存
    if request.method == 'POST':  # 当以post方式提交数据时
        print('PostRequest!')
        data=request.form['data_url']
        # data = request.get_data()
        # print(data[22:])
        data=data[22:]

        #将base64解码生成图片文件并保存
        imgdata = base64.b64decode(data)
        file = open('FaceDetect/faces/face.jpg', 'wb')
        file.write(imgdata)
        file.close()

        #识别人脸数据并返回信息
        user_info = face.face_search('FaceDetect/faces/face.jpg')
        print(user_info)
        if (user_info[0]):
            if(user_info[1]):
                #图片中人脸太多，重新拍照
                return "照片中人脸多于1张，请重新拍摄！"
            else:
                # 找到了已经注册的用户
                return "\n搜索到已存在用户！\n该用户信息为 user_id:%s\n           name:%s\n" \
                      "           gender:%s\n           age:%s\n           phone_number:%s" \
                      % (user_info[2], user_info[3], user_info[4], user_info[5], user_info[6])

        elif user_info[1]:
            # 用户未注册，创建新用户
            return "\n未搜索到已存在用户！\n新创建的用户信息为 user_id: %s\n其他信息为空！ " \
                   % (user_info[2])
        else:
            # 检测失败(因为各种各样的原因)
            return "人脸检测失败！ 请检查控制台信息，网络连接和照片是否包含人脸。\n（或者faceset为空！\n或者为 faceset中搜索到已存在用户！数据库中未搜索到匹配用户）"


    # if request.method == 'GET':  # 当以post方式提交数据时

    return ''

'''
1.注册信息接收/更新用户信息
格式：  data = {
        "userid": userid,
        "username": name,
        "usersex": sex,
        "userage": age,
        "usernumber":number
    };
'''
@app.route('/login', methods=["GET", "POST"])
def login():
    if request.method == "POST":
        data = request.get_json()
        users=""
        for key in data:
            #print(key + ':' + data[key])
            if(key=="userid"):
                users=query_user_by_userid(int(data[key]))
        for key in data:
            if(key=="userage"):
                users.age=data[key]
            if(key=="username"):
                users.name=data[key]
            if(key=="usersex"):
                users.sex=data[key]
            if(key=="usernumber"):
                users.phone_num=data[key]
        update_user_info(users)
        return("success")
    else:
        return render_template("login.html")


'''
1.用户购买信息接收
2.保存购买信息到数据库
'''
@app.route('/goods', methods=["GET", "POST"])
def savePurchase():
    if request.method == "POST":
        data = request.get_json()
        num=len(data)
        for i in range(num):
            for key in data[i]:
                if (key == "user_id"):
                    user_id=data[i][key]
                if (key == "good_id"):
                    good_id=data[i][key]
                if (key == "purchase_date"):
                    purchase_date = data[i][key]
                if (key == "total_price"):
                    total_price = data[i][key]
                if (key == "count"):
                    count=data[i][key]
            add_purchase_history(int(user_id), int(good_id), int(count), total_price, purchase_date)
        return("success")
    else:
        return render_template("login.html")


'''
1.接收用户ID
2.调用用户分析模块（预留）
3.根据用户分析购买推荐，返回给前台购买推荐信息
'''
@app.route('/recom', methods=["GET", "POST"])
def transReco():
    if request.method == "POST":
        #data获取用户id
        data = request.get_json()
        #userid作为用户行为分析模块的入参
        for key in data:
            userid=data[key]
        reco=multiple_recommendation(int(userid))
        num = len(reco)
        if(num==0):
            return("0")
        else:
            get_reco=""
            for i in range(5):
                goods_info=query_goods(reco[i])
                price=str(Decimal(goods_info.price).quantize(Decimal('0.0')))
                get_reco=get_reco+goods_info.name+","+price+","
            return get_reco
    else:
        return render_template("login.html")


def transReco_test():
    reco=multiple_recommendation()
    num = len(reco)
    if(num==0):
        return("0")
    else:
        get_reco=""
        for i in range(5):
            goods_info=query_goods(reco[i])
            price=str(Decimal(goods_info.price).quantize(Decimal('0.0')))
            get_reco=get_reco+goods_info.name+","+price+","
        print(get_reco)


# =============================================================================
# =============================== NoobMobile ==================================
# =============================================================================
@app.route('/get_user_info', methods=["GET", "POST"])
def get_user_info():
    """
    通过人脸识别，获取biomarker。
    biomarker匹配数据库用户表，返回用户所有信息。
    :return: success: 用户信息json字符串
             fail：传回None值
    """
    if request.method == "POST":
        try:
            biomarker = request.get_json()["biomarker"]
            user = query_user(biomarker)
            user_string = json.dumps(user.getinfo())
            assert user_string != "", "get user info failed!"
            return user_string
        except Exception as e:
            print("error: {}\n get user info failed! Error type biomarker get!".format(e))
            return None
    else:
        return None


@app.route('/perfect_user_info', methods=["GET", "POST"])
def perfect_user_info():
    """
    完善用户信息name, sex, age, occupation, phone_num, other1, 2, 3
    :return: success: information upload successfully
              fail: information uploads failed
    """
    if request.method == "POST":
        try:
            req_data = request.get_json()
            user = query_user(req_data["biomarker"])
            user.name = req_data["name"]
            user.sex = req_data["sex"]
            user.age = req_data["age"]
            user.occupation = req_data["occupation"]
            user.other1 = req_data["other1"]
        except Exception as e:
            print(e)
            print("upload data struction error!")
            return "information uploads failed"

        # 更新用户信息
        try:
            update_user_info(user)
            return "information upload successfully"
        except Exception as e:
            print(e)
            return "information uploads failed"
    else:
        return "information uploads failed"


@app.route('/recommend', methods=["GET", "POST"])
def recommend():
    """
    获取小程序请求，返回推荐信息
    :return:success: res_dict{"recommends": [{goods.get_info()字典数据}, ...]}
             fail: None(没有商品推荐目前也是None，后期待改为常规推荐)
    """
    if request.method == "POST":
        try:
            user_id = request.get_json()["user_id"]
            assert user_id, "the acquired user_id is error"
            # 通过user_id，获得用户推荐
            recommends = multiple_recommendation()
            if 0 == len(recommends):  # 待改，可以进行常规商品推荐
                return None
            else:
                res_dict = {}
                rec_list = []
                for rec in recommends:  # rec商品id
                    goods = query_goods(rec)
                    rec_list.append(goods.getinfo())
                res_dict["recommends"] = rec_list
                return json.dumps(res_dict, cls=DecimalEncoder)
        except Exception as e:
            print("error: {}\n get recommends failed!".format(e))
            return None
    else:
        return None


@app.route('/get_consumption_data_info', methods=["GET", "POST"])
def get_consumption_data_info():
    """
    通过user_id，获得用户近5年的每月消费金额.
    没有消费返回0.
    :return: success: {2019: [1,2,3,...,12],
                       2018: [1,2,3,...,12]
                        ...
                        "average": [1,2,3...12]}
              fail: None
    """
    if request.method == "POST":
        try:
            # 获取当前年份
            this_year = datetime.datetime.now().year
            res_dict = {}
            user_id = request.get_json()["user_id"]
            histories = get_session().query(Purchase_history.total_price, Purchase_history.purchase_date
                                            ).filter(Purchase_history.user_id == user_id).all()
            for i in range(5):  # 目前默认5年
                res_dict[this_year - i] = every_month_consumption(this_year - i, histories)

            # 计算平均（从开始使用算起）
            first_record = get_session().query(Purchase_history.purchase_date).filter(
                Purchase_history.user_id == user_id).order_by(Purchase_history.purchase_date.asc()).first()
            register_year = first_record[0].year
            register_month = first_record[0].month
            res_dict = average_month_consumption(res_dict, register_year, register_month, this_year)
            return json.dumps(res_dict, cls=DecimalEncoder)
        except Exception as e:
            print(e)
            print("failed to get the data of user of every consumption!")
            return None
    else:
        return None


@app.route('/get_consumption_category_info', methods=["GET", "POST"])
def get_consumption_category_info():
    """
    通过user_id，获得用户输入指定（年， 月）的消费结构
    :return:{"category1": 0.3,
               "category2": 0.2
               ...
               "average": [使用至今六种类型商品的平均占比]}
    """
    if request.method == "POST":
        try:
            req_data = request.get_json()
            user_id = req_data["user_id"]
            year = req_data["year"]
            month = req_data["month"]
        except Exception as e:
            print(e)
            print("request the function paramters of get_consumption_category_info failed!")
            return None
        try:
            # categories: [(category_name, ), (category_name, )...]
            categories = get_session().query(Goods_category.category_name).all()
            res_dict = {}
            # 初始化结果字典
            for c in categories:
                res_dict[c[0]] = 0
            # for h in histories:
            #     category_name = get_session().query(Goods_category.category_name).\
            #                         join(Goods, Goods.category == Goods_category.category_id).\
            #                             filter(Goods.good_id == h[0]).one()
            # 所有在当月和年购买的商品类别名称集合
            records = get_session().query(Goods_category.category_name).\
                join(Goods, Goods.category == Goods_category.category_id).\
                join(Purchase_history, Purchase_history.good_id == Goods.good_id). \
                filter(Purchase_history.user_id == user_id).\
                filter(extract('year', Purchase_history.purchase_date) == year).\
                filter(extract('month', Purchase_history.purchase_date) == month).all()
            if len(records) > 0:  # 有购物记录
                for r in records:
                    res_dict[r[0]] += 1
                for key in res_dict:
                    res_dict[key] = res_dict[key] / len(records)

            # 用户总购买商品类型占比
            res_dict["average"] = []
            whole_records = get_session().query(Goods_category.category_name). \
                join(Goods, Goods.category == Goods_category.category_id). \
                join(Purchase_history, Purchase_history.good_id == Goods.good_id). \
                filter(Purchase_history.user_id == user_id).all()
            whole_dict = {}
            # 初始化总体购买商品类型字典
            for c in categories:
                whole_dict[c[0]] = 0
            if len(whole_records) > 0:  # 存在购买记录
                for r in whole_records:
                    whole_dict[r[0]] += 1
                for key in whole_dict:
                    whole_dict[key] = whole_dict[key] / len(whole_records)
                    res_dict["average"].append(whole_dict[key])
            # 返回字符串化结果字典
            return json.dumps(res_dict, cls=DecimalEncoder)
        except Exception as e:
            print("error: {}\n failed to get info of consumption_category!".format(e))
            return None
    else:
        return None


@app.route("/get_general_consumption_info", methods=["GET", "POST"])
def get_general_consumption_info():
    """
    通过user_id，获得用户的总统计消费情况
    :return:{"days": 341,
               "times": 13,
               "money": 543.6}
    """
    if request.method == "POST":
        try:
            req_data = request.get_json()
            user_id = req_data["user_id"]
        except Exception as e:
            print(e)
            print(
                "request the function paramters of get_general_consumption_info failed!"
            )
            return None
        try:
            res_dict = {}
            # 计算用户第一次购物到现在过了几天
            session = get_session()
            sql = (
                "SELECT datediff(sysdate(),(SELECT min(purchase_date) FROM purchase_history where user_id=%s ))"
                % user_id
            )
            result = session.execute(sql)
            session.commit()
            for i in result:
                res_dict["days"] = i[0]
            # 计算用户购买了多少次
            sql = (
                "SELECT count(*) from (SELECT DISTINCT purchase_date , user_id from  purchase_history where user_id=%s ) as tmp"
                % user_id
            )
            result = session.execute(sql)
            session.commit()
            for i in result:
                res_dict["times"] = i[0]
            # 计算用户一共花了多少钱
            sql = "select sum(total_price) from purchase_history WHERE user_id={}".format(user_id)
            result = session.execute(sql)
            session.commit()
            for i in result:
                res_dict["money"] = i[0]

            # 返回字符串化结果字典
            return json.dumps(res_dict)
        except Exception as e:
            print("error: {}\n failed to get info of consumption_category!".format(e))
            return None
    else:
        return None


@app.route("/get_consumption_data_info", methods=["GET", "POST"])
def get_consumption_data_info():
    """
    通过user_id和用户修改的姓名、年龄、职业和手机号信息更新用户的消费记录.
    用户没有输入就提交则传输空字符串"".
    :return: success: {"success":'yes'}
              fail: None
    """
    if request.method == "POST":
        try:
            req_data = request.get_json()
            user_id = req_data["user_id"]
            name = req_data["name"]
            age = req_data["age"]
            occupation = req_data["occupation"]
            phone_num = req_data["phone_num"]
        except Exception as e:
            print(e)
            print(
                "request the function paramters of get_general_consumption_info failed!"
            )
            return None
        try:
            res_dict = {}

            # 获取用户购买记录
            session = get_session()
            sql = "UPDATE user_info SET name=\'{}\', age={},occupation=\'{}\',phone_num=\'{}\' WHERE user_id={}".format(
                name, age, occupation, phone_num, user_id
            )
            session.execute(sql)
            session.commit()

            res_dict["success"] = "yes"
            # 返回字符串化结果字典
            return json.dumps(res_dict)
        except Exception as e:
            print("error: {}\n failed to update SQL of userinfo!".format(e))
            return None
    else:
        return None


# =========================================================================
# ================================data calculation=========================
# =========================================================================
def every_month_consumption(year, histories):
    """
    通过已经筛选的用户购买记录，获取这一年每个月的消费金额
    :param year:
    :param histories:[(total_price, purchase_date), ()]
    :return: type: list
              content: [1-12月的消费金额]
    """
    res_list = []
    histories = [h for h in histories if year == h[1].year]
    # 初始化为0
    for i in range(12):
        res_list.append(0)
    for h in histories:
        res_list[h[1].month - 1] += h[0]
    return res_list


def average_month_consumption(res_dict, register_year, register_month, this_year):
    """
    计算从用户注册使用开始，近五年每个月的平均消费金额
    :param register_year: 注册使用年份
    :param register_month: 注册使用月份
    :param res_dict:
    :param this_year: 当前年份
    :return: res_dic = {2018: [], 2017: [], ..., "average": []}
    """
    res_dict["average"] = []
    for i in range(12):
        if i >= register_month - 1:
            res_dict["average"].append((res_dict[this_year][i] + res_dict[this_year - 1][i] +
                                        res_dict[this_year - 2][i] + res_dict[this_year - 3][i] +
                                        res_dict[this_year - 4][i]) / (this_year - register_year + 1)
                                       if register_year >= this_year - 4 else 5)
        else:
            res_dict["average"].append((res_dict[this_year][i] + res_dict[this_year - 1][i] +
                                        res_dict[this_year - 2][i] + res_dict[this_year - 3][i] +
                                        res_dict[this_year - 4][i]) / (this_year - register_year)
                                       if register_year >= this_year - 4 else 5)
    return res_dict


if __name__ == '__main__':
    # app.run(debug=True, host="0.0.0.0", ssl_context=("/home/noob/ssl/server.crt", "/home/noob/ssl/server.key"))
    app.run(debug=True)


