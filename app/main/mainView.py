# import sys
# sys.path.append("/home/noob/Noob/")
from flask import Flask, render_template, request
from flask import render_template
from app.main.dbapi import *

from app.main.DataAnalysis.Func.Recommendations import multiple_recommendation, personalized_recommendation
from app.models.models import get_session, Goods, Shopping_record

from decimal import *
from datetime import timedelta
import app.main.FaceDetect.faceDetect as face
import os
import base64
from sqlalchemy import extract
import json
import datetime
import decimal
import random

# 初始化获取用户id
_userId = 0
# 物联网商品长度
Len = 0


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


@app.route('/chart-chartist')
def welcome():
    """
    数据统计路由
    """
    return render_template("chart-chartist.html")


@app.route('/video')
def video():
    """
    无人收银
    """
    return render_template("video.html")


@app.route('/customer')
def customer():
    """
    无人收银主页
    """
    return render_template("customer.html")


@app.route('/goods_info', methods=['GET', 'POST'])
def goods_info():
    """

    :return: 若记录发生变化，返回-1；否则返回变化后的记录
    """
    # 全局变量记录条数是否变化
    global Len
    if request.method == 'POST':
        # 数据库会话
        session = get_session()
        # 获取购物车商品列表
        shopping_record_list = session.query(Shopping_record).all()
        # 条数发生变化
        if Len != len(shopping_record_list):
            return_str = ''
            count_dict = {}
            str_dict = {}
            Len = len(shopping_record_list)
            for item in shopping_record_list:
                # 读取商品信息
                good_info = session.query(Goods).filter(Goods.good_id == item.good_id).one()
                # 叠加商品数量
                if good_info.good_id in count_dict:
                    count_dict[good_info.good_id] += 1
                    # 返回值用','分割元素,';'分割对象
                    str_dict[good_info.good_id] = str(good_info.good_id) + ',' + str(good_info.name) + ',' + str(
                        count_dict[good_info.good_id]) + ',' + str(good_info.price) + ',' + str(
                        good_info.category) + ';'
                # 初始化商品
                else:
                    count_dict[good_info.good_id] = 1
                    # 返回值用','分割元素,';'分割对象
                    str_dict[good_info.good_id] = str(good_info.good_id) + ',' + str(good_info.name) + ',' + str(
                        count_dict[good_info.good_id]) + ',' + str(good_info.price) + ',' + str(
                        good_info.category) + ';'
            for key in str_dict:
                return_str += str_dict[key]
            # 关闭会话
            session.close()
            return return_str
        else:
            # 关闭会话
            session.close()
            return '-1'
    else:
        return render_template('index.html')


@app.route('/init', methods=["GET", "POST"])
def init():
    """
    初始化接收chart请求，返回图标数据
    :return:str(1,2,3,4...,18)
    """
    u = query_purchase_history()
    purchase = len(u)
    totaling = [0 for n in range(12)]
    category = [0 for n in range(6)]
    for i in range(purchase):
        year = u[i].purchase_date.year
        month = u[i].purchase_date.month
        templatemode = u[i].category_id
        if year == 2018 and month == 1:
            totaling[0] = totaling[0] + int(u[i].total_price)
        if year == 2018 and month == 2:
            totaling[1] = totaling[1] + int(u[i].total_price)
        if year == 2018 and month == 3:
            totaling[2] = totaling[2] + int(u[i].total_price)
        if year == 2018 and month == 4:
            totaling[3] = totaling[3] + int(u[i].total_price)
        if year == 2018 and month == 5:
            totaling[4] = totaling[4] + int(u[i].total_price)
        if year == 2018 and month == 6:
            totaling[5] = totaling[5] + int(u[i].total_price)
        if year == 2018 and month == 7:
            totaling[6] = totaling[6] + int(u[i].total_price)
        if year == 2018 and month == 8:
            totaling[7] = totaling[7] + int(u[i].total_price)
        if year == 2018 and month == 9:
            totaling[8] = totaling[8] + int(u[i].total_price)
        if year == 2018 and month == 10:
            totaling[9] = totaling[9] + int(u[i].total_price)
        if year == 2018 and month == 11:
            totaling[10] = totaling[10] + int(u[i].total_price)
        if year == 2018 and month == 12:
            totaling[11] = totaling[11] + int(u[i].total_price)
        if templatemode == 1:
            category[0] = category[0] + int(u[i].total_price)
        if templatemode == 2:
            category[1] = category[1] + int(u[i].total_price)
        if templatemode == 3:
            category[2] = category[2] + int(u[i].total_price)
        if templatemode == 4:
            category[3] = category[3] + int(u[i].total_price)
        if templatemode == 5:
            category[4] = category[4] + int(u[i].total_price)
        if templatemode == 6:
            category[5] = category[5] + int(u[i].total_price)
    charting = ""
    for i in range(12):
        if i == 0:
            charting = totaling[0]
        else:
            charting = '{},{}'.format(charting, totaling[i])
    for i in range(6):
        charting = '{},{}'.format(charting, category[i])
    if request.method == "POST":
        return charting
    else:
        return render_template("login.html")


@app.route('/initinfo', methods=["GET", "POST"])
def init_info():
    """
    初始化接收post请求，返回常规推荐
    :return:str
    """
    if request.method == "POST":
        recommend = multiple_recommendation(1)
        num = len(recommend)
        get_recommend = ""
        for i in range(num):
            good_info = query_goods(recommend[i])
            price = str(Decimal(good_info.price).quantize(Decimal('0.0')))
            get_recommend = get_recommend + good_info.name + "," + price + "," + good_info.category + ","
        return get_recommend
    else:
        return render_template("login.html")


@app.route('/purchase', methods=['GET', 'POST'])
def get_buy_info():
    """
    1.返回用户购买信息
    2.return:purchaseInfo
        type:str
    """
    if request.method == 'POST':  # 当以post方式提交数据时
        raggedest = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
                     19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 44,
                     45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
                     61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74]
        num = random.randint(3, 5)
        table = random.sample(raggedest, num)
        num = len(table)
        buying = ""
        for i in range(num):
            temp = query_goods(table[i])
            if i == 0:
                buying = '{},{},{},{},{}'.format(temp.good_id, temp.name, random.randint(1, 5),
                                                 temp.price, temp.category)
            else:
                buying = '{},{}'.format(buying, '{},{},{},{},{}'.format(temp.good_id, temp.name,
                                        random.randint(1, 5), temp.price, temp.category))
        return buying


@app.route('/get_user', methods=['GET', 'POST'])
def get_user():
    """
    1.返回用户id
    2.return:userId
        type:str
    """
    if request.method == 'POST':  # 当以post方式提交数据时
        global _userId
        return str(_userId)


@app.route('/upload', methods=['GET', 'POST'])
def upload_test():
    """
    1.保存照片到本地
    2.上传并进行人脸检测
    3.人脸检测返回值为user_info，为一个列表：
                如果找到了已经存在的用户，返回形如list[True,False,user_id,name,gender,age,phone_number]的列表
                如果图片中有多张人脸，则返回[True,True],提示重新拍照
                若没有找到则返回list[False,True,user_id],user_id为新创建的用户的id
                若检测失败(因为网络问题或者没有检测到人脸)，则返回list[False,False]
    """
    print('uploading!')
    # 获取图片文件并保存
    if request.method == 'POST':  # 当以post方式提交数据时
        print('PostRequest!')
        data = request.form['data_url']
        # data = request.get_data()
        # print(data[22:])
        data = data[22:]

        # 将base64解码生成图片文件并保存
        imgdata = base64.b64decode(data)
        file = open('FaceDetect/faces/face.jpg', 'wb')
        file.write(imgdata)
        file.close()

        # 识别人脸数据并返回信息
        user_info = face.face_search('FaceDetect/faces/face.jpg')
        global _userId
        print(user_info)
        if user_info[0]:
            if user_info[1]:
                # 图片中人脸太多，重新拍照
                return "照片中人脸多于1张，请重新拍摄！"
            else:
                # 找到了已经注册的用户
                _userId = int(user_info[2])
                return "搜索到已存在用户！该用户信息为:\n user_id:%s\n name:%s\n" \
                      " gender:%s\n age:%s\n phone_number:%s" \
                      % (user_info[2], user_info[3], user_info[4], user_info[5], user_info[6])

        elif user_info[1]:
            # 用户未注册，创建新用户
            _userId = int(user_info[2])
            return "未搜索到已存在用户！\n新创建的用户信息为 user_id: %s\n其他信息为空！ " \
                   % (user_info[2])
        else:
            # 检测失败(因为各种各样的原因)
            return "人脸检测失败！ 请检查控制台信息，网络连接和照片是否包含人脸。\n（或者faceset为空！\n或者为 faceset中搜索到已存在用户！数据库中未搜索到匹配用户）\n"
    # if request.method == 'GET':  # 当以post方式提交数据时
    return ''


@app.route('/login', methods=["GET", "POST"])
def login():
    """
    1.注册信息接收/更新用户信息
    格式：  data = {
            "userId": userId,
            "userName": name,
            "userSex": sex,
            "userAge": age,
            "userNumber":number
        };
    """
    if request.method == "POST":
        data = request.get_json()
        users = ""
        for key in data:
            # print(key + ':' + data[key])
            if key == "userid":
                users = query_user_by_userid(int(data[key]))
        for key in data:
            if key == "userage":
                users.age = data[key]
            if key == "username":
                users.name = data[key]
            if key == "usersex":
                users.sex = data[key]
            if key == "usernumber":
                users.phone_num = data[key]
        update_user_info(users)
        return "success"
    else:
        return render_template("login.html")


@app.route('/goods', methods=["GET", "POST"])
def save_info():
    """
    1.用户购买信息接收
    2.保存购买信息到数据库
    """
    if request.method == "POST":
        data = request.get_json()
        print(data)
        num = len(data)
        for i in range(num):
            for key in data[i]:
                if key == "user_id":
                    user_id = data[i][key]
                    if user_id == "":
                        return "error"
                if key == "good_id":
                    good_id = data[i][key]
                if key == "purchase_date":
                    purchase_date = data[i][key]
                if key == "total_price":
                    total_price = data[i][key]
                if key == "count":
                    count = data[i][key]
                if key == "category_id":
                    category_id = data[i][key]
            add_purchase_history(int(user_id), int(good_id), int(count),
                                    total_price, purchase_date, int(category_id), 1)
        return "success"
    else:
        return render_template("login.html")


@app.route('/recom', methods=["GET", "POST"])
def transfer():
    """
    1.接收用户ID
    2.调用用户分析模块
    3.根据用户分析购买推荐，返回给前台购买推荐信息
    flag：0个性化推荐
    flag: 1常规推荐
    flag: 2季节性推荐
    flag: 3热点推荐
    """
    if request.method == "POST":
        # data获取用户id
        data = request.get_json()
        print(data)
        # recommend 临时存放推荐商品ID
        recommend = ""
        # user作为用户行为分析模块的入参
        user = ""
        flag = 4
        for key in data:
            if key == "user_id":
                user = data[key]
                print(user)
                print(type(user))
            if key == "flag":
                flag = int(data[key])
        if user == "":
            return "failed to receive userid"
        # 异常处理模块,购买记录为空则无法推荐
        session = get_session()
        limit = len(session.query(Purchase_history).filter(
            Purchase_history.user_id == user).all())
        if limit == 0 and flag == 0:
            return "error1"
        if flag == 0:
            recommend = personalized_recommendation(int(user))
            print(recommend)
        else:
            if flag == 1 or flag == 2 or flag == 3:
                recommend = multiple_recommendation(flag)
        print(recommend)
        num = len(recommend)
        get_recommend = ""
        for i in range(num):
            good_info = query_goods(recommend[i])
            price = str(Decimal(good_info.price).quantize(Decimal('0.0')))
            get_recommend = get_recommend + good_info.name + "," + price + "," + good_info.category + ","
        return get_recommend
    else:
        return render_template("login.html")


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


@app.route("/get_recommend_info", methods=["GET", "POST"])
def get_recommend_info():
    """
    获取用户喜欢的所有商品信息
    flag: 1常规推荐
    flag: 2季节性推荐
    flag: 3热点推荐
    :return: res_dict = {"data": [{good_id:
                                   name:
                                   ...:
                                   recommend: ["个性推荐"， "常规推荐"]}]}
             失败返回： None
    """
    if request.method == "POST":
        try:
            req_data = request.get_json()
            user_id = req_data["user_id"]
        except Exception as e:
            print(e)
            print(
                "request the function paramters of get_like_info failed!"
            )
            return None
        try:
            res_dict = {}
            res_list = []
            personalized_recos = personalized_recommendation(user_id)
            routine_recos = multiple_recommendation(1)
            quarter_recos = multiple_recommendation(2)
            hot_recos = multiple_recommendation(3)
            recommend_list = list(set(personalized_recos + routine_recos + quarter_recos + hot_recos))  # 所有推荐商品
            random.shuffle(recommend_list)  # 打乱
            for good_id in recommend_list:
                recommend_category = []  # 推荐类别
                item_dict = query_goods(good_id).getinfo()
                item_dict["category"] = query_goods_category(item_dict["category"]).category_name
                if good_id in personalized_recos:
                    recommend_category.append("个性化推荐")
                elif good_id in routine_recos:
                    recommend_category.append("常规推荐")
                elif good_id in quarter_recos:
                    recommend_category.append("季节推荐")
                elif good_id in hot_recos:
                    recommend_category.append("热点推荐")
                item_dict["recommend"] = recommend_category
                # 添加一个商品信息及推荐类型
                res_list.append(item_dict)
            res_dict["data"] = res_list
            # 返回字符串化结果字典
            return json.dumps(res_dict, cls=DecimalEncoder)
        except Exception as e:
            print("error: {}\n failed to get SQL of like_info!".format(e))
            return None
    else:
        return None


@app.route('/get_like_and_comments', methods=["GET", "POST"])
def get_like_and_comments():
    """
    输入user_id和good_id,输出用户是否喜欢、总喜欢数、总评论数、评论数组。
    :return: success:
                {
                like:1/0,
                likecount:55,
                commentcount:45,
                comments:[{
                            gender:1/0(1为男性，0为女性,若用户无性别信息则默认为男性),
                            name:张三,
                            time:2018-9-21,
                            txt:评论内容
                        },...]
                }
             fail：传回None值
    """
    if request.method == "POST":
        try:
            uid = request.get_json()["user_id"]
            gid = request.get_json()["goods_id"]
            res_dict = {}
            tag = 0
            sql = (
                    "select * FROM like_info WHERE user_id=%s and good_id=%s "
                    % (uid, gid)
            )
            session = get_session()
            is_like = session.execute(sql)
            session.commit()
            for i in is_like:
                tag = 1
            res_dict['like'] = tag  # 获取是否喜欢

            sql = (
                    "select count(*) FROM like_info WHERE good_id=%s"
                    % gid
            )
            like_count = session.execute(sql)
            for i in like_count:
                res_dict['likecount'] = i[0]  # 获取喜欢数量

            sql = (
                    "select count(*) FROM goods_comment WHERE good_id=%s"
                    % gid
            )
            cmt_count = session.execute(sql)
            for i in cmt_count:
                res_dict['commentcount'] = i[0]  # 获取总评论数量

            sql = (
                    "select * FROM goods_comment WHERE good_id=%s"
                    % gid
            )

            like_count = session.execute(sql)
            cmt_list = list()
            for i in like_count:
                cmt_dict = dict()
                cmt_dict['gender'] = i[4]
                cmt_dict['name'] = i[-1]
                cmt_dict['time'] = str(i[5])
                cmt_dict['txt'] = i[3]
                cmt_list.append(cmt_dict)
            res_dict['comments'] = cmt_list
            return json.dumps(res_dict)
        except Exception as e:
            print("error: {}\n get user info failed! Error type biomarker get!".format(e))
            return None
    else:
        return None


@app.route("/insert_like_info", methods=["GET", "POST"])
def insert_like_info():
    """
    新增一条like_info中指定的一行用户喜欢
    :return: res_dict = {"success": "yes"}
             失败返回： None
    """
    if request.method == "POST":
        try:
            req_data = request.get_json()
            user_id = req_data["user_id"]
            good_id = req_data["good_id"]
        except Exception as e:
            print(e)
            print(
                "request the function paramters of insert_like_info failed!"
            )
            return None
        try:
            res_dict = {}
            add_goods_like(user_id, good_id)
            res_dict["success"] = "yes"
            # 返回字符串化结果字典
            return json.dumps(res_dict, cls=DecimalEncoder)
        except Exception as e:
            print("error: {}\n failed to add SQL of like_info!".format(e))
            return None
    else:
        return None


@app.route("/insert_comment", methods=["GET", "POST"])
def insert_comment():
    """
    新增一条用户对某个商品的评论
    :return: res_dict = {"success": "yes"}
             失败返回： None
    """
    if request.method == "POST":
        try:
            req_data = request.get_json()
            user_id = req_data["user_id"]
            good_id = req_data["good_id"]
            txt = req_data["content"]
            gender = req_data["gender"]
            time = req_data["time"]
            name = req_data["name"]

        except Exception as e:
            print(e)
            print(
                "request the function paramters of insert_comment failed!"
            )
            return None
        try:
            res_dict = {}
            add_goods_comment(user_id=user_id, good_id=good_id, content=txt, time=time, name=name, gender=gender)
            res_dict["success"] = "yes"
            # 返回字符串化结果字典
            return json.dumps(res_dict, cls=DecimalEncoder)
        except Exception as e:
            print("error: {}\n failed to add SQL of insert_comment!".format(e))
            return None
    else:
        return None


@app.route("/delete_like_info", methods=["GET", "POST"])
def delete_like_info():
    """
    删除like_info中指定的一行用户喜欢
    :return: res_dict = {"success": "yes"}
             失败返回： None
    """
    if request.method == "POST":
        try:
            req_data = request.get_json()
            user_id = req_data["user_id"]
            good_id = req_data["good_id"]
        except Exception as e:
            print(e)
            print(
                "request the function paramters of delete_like_info failed!"
            )
            return None
        try:
            res_dict = {}
            delete_like(user_id, good_id)
            res_dict["success"] = "yes"
            # 返回字符串化结果字典
            return json.dumps(res_dict, cls=DecimalEncoder)
        except Exception as e:
            print("error: {}\n failed to delete SQL of like_info!".format(e))
            return None
    else:
        return None


# @app.route('/recommend', methods=["GET", "POST"])
# def recommend():
#     """
#     获取小程序请求，返回推荐信息
#     :return:success: res_dict{"recommends": [{goods.get_info()字典数据}, ...]}
#              fail: None(没有商品推荐目前也是None，后期待改为常规推荐)
#     """
#     if request.method == "POST":
#         try:
#             user_id = request.get_json()["user_id"]
#             assert user_id, "the acquired user_id is error"
#             # 通过user_id，获得用户推荐
#             recommends = multiple_recommendation()
#             if 0 == len(recommends):  # 待改，可以进行常规商品推荐
#                 return None
#             else:
#                 res_dict = {}
#                 rec_list = []
#                 for rec in recommends:  # rec商品id
#                     goods = query_goods(rec)
#                     rec_list.append(goods.getinfo())
#                 res_dict["recommends"] = rec_list
#                 return json.dumps(res_dict, cls=DecimalEncoder)
#         except Exception as e:
#             print("error: {}\n get recommends failed!".format(e))
#             return None
#     else:
#         return None


@app.route("/get_like_info", methods=["GET", "POST"])
def get_like_info():
    """
    获取用户喜欢的所有商品信息
    :return: res_dict = {"data": [{good_id:
                                   good_name:
                                   ...:
                                   }],...}
             失败返回： None
    """
    if request.method == "POST":
        try:
            req_data = request.get_json()
            user_id = req_data["user_id"]
        except Exception as e:
            print(e)
            print(
                "request the function paramters of get_like_info failed!"
            )
            return None
        try:
            res_dict = {}
            res_list = []
            goods = get_session().query(Goods).join(Like_info, Like_info.good_id == Goods.good_id). \
                filter(Like_info.user_id == user_id).all()  # 获取用户喜欢的所有商品信息
            for good in goods:
                item_dict = good.getinfo()
                # 添加一个商品信息及推荐类型
                res_list.append(item_dict)
            res_dict["data"] = res_list
            # 返回字符串化结果字典
            return json.dumps(res_dict, cls=DecimalEncoder)
            # return json.dumps(res_dict)
        except Exception as e:
            print("error: {}\n failed to get SQL of like_info!".format(e))
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
            records = get_session().query(Goods_category.category_name). \
                join(Goods, Goods.category == Goods_category.category_id). \
                join(Purchase_history, Purchase_history.good_id == Goods.good_id). \
                filter(Purchase_history.user_id == user_id). \
                filter(extract('year', Purchase_history.purchase_date) == year). \
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
                res_dict["days"] = i[0] if i[0] else 0
            # 计算用户购买了多少次
            sql = (
                    "SELECT count(*) from (SELECT DISTINCT purchase_date , user_id from  purchase_history where user_id=%s ) as tmp"
                    % user_id
            )
            result = session.execute(sql)
            session.commit()
            for i in result:
                res_dict["times"] = i[0] if i[0] else 0
            # 计算用户一共花了多少钱
            sql = "select sum(total_price) from purchase_history WHERE user_id={}".format(user_id)
            result = session.execute(sql)
            session.commit()
            for i in result:
                res_dict["money"] = i[0] if i[0] else 0

            # 返回字符串化结果字典
            return json.dumps(res_dict, cls=DecimalEncoder)
        except Exception as e:
            print("error: {}\n failed to get info of consumption_category!".format(e))
            return None
    else:
        return None


@app.route("/get_purchase_history", methods=["GET", "POST"])
def get_purchase_history():
    """
    通过user_id和年月，获得用户当月的购买历史记录
    :return:{
        "history":
                [{"time": 该条购买记录的时间 '23号16:23',
               "name": 商品名字 '六个核桃核桃乳植物蛋白',
               "num": 购买数量 '5',
               "count": 金额总计 '234'},
                ...]}
    """
    if request.method == "POST":
        try:
            req_data = request.get_json()
            user_id = req_data["user_id"]
            selected_year = req_data["year"]
            selected_month = req_data["month"]
        except Exception as e:
            print(e)
            print(
                "request the function paramters of get_general_consumption_info failed!"
            )
            return None
        try:
            res_dict = {}
            his_list = []

            # 获取用户购买记录
            session = get_session()
            result = session.query(Purchase_history.purchase_date, Goods.name, Purchase_history.count,
                                   Purchase_history.total_price). \
                join(Goods, Purchase_history.good_id == Goods.good_id). \
                filter(Purchase_history.user_id == user_id). \
                filter(extract('year', Purchase_history.purchase_date) == selected_year). \
                filter(extract('month', Purchase_history.purchase_date) == selected_month).all()
            for i in result:
                his_item = dict()
                his_item["time"] = "{}号{}:{}".format(i[0].month, i[0].hour, i[0].minute)
                his_item["name"] = i[1]
                his_item["num"] = i[2]
                his_item["count"] = i[3]
                his_list.append(his_item)

            res_dict["history"] = his_list
            # 返回字符串化结果字典
            return json.dumps(res_dict, cls=DecimalEncoder)
        except Exception as e:
            print("error: {}\n failed to get info of consumption_category!".format(e))
            return None
    else:
        return None


@app.route("/perfect_info", methods=["GET", "POST"])
def perfect_info():
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
            user = query_user_by_userid(user_id)
            user.name = name
            user.age = age
            user.occupation = occupation
            user.phone_num = phone_num
            update_user_info(user)

            res_dict["success"] = "yes"
            # 返回字符串化结果字典
            return json.dumps(res_dict)
        except Exception as e:
            print("error: {}\n failed to update SQL of userinfo!".format(e))
            return None
    else:
        return None


@app.route("/face_login", methods=["GET", "POST"])
def face_login():
    """
    通过用户上传的图片文件，进行人脸识别，返回识别信息
    :return:{
                "count": 图片中有几张人脸 ,
                "user_id": 用户id ,
                "is_new": 是否是老用户 ,
                "user_info": {(用户的信息字段字典)
                                'biomarker': self.biomarker,
                                'name': self.name,
                                'sex': self.sex,
                                'age': self.age,
                                'occupation': self.occupation,
                                'phone_num': self.phone_num,
                                'other1': self.other1,
                                'other2': self.other2,
                                'other3': self.other3
                            }
                }
    """
    try:
        print(
            "saving the face jpg file !"
        )
        f = request.files['image_file']

        basepath = os.path.dirname(__file__)  # 当前文件所在路径
        upload_path = os.path.join(basepath, "FaceDetect")
        upload_path = os.path.join(upload_path, "faces", 'face.jpg')
        f.save(upload_path)
        f.close()

        # 识别人脸数据并返回信息
        res_dict = {}
        user_info = face.face_search('FaceDetect/faces/face.jpg')
        print(user_info)
        if user_info[0]:
            if user_info[1]:
                # 图片中人脸太多，重新拍照
                res_dict = {
                    "count": 2,
                }

            else:
                # 找到了已经注册的用户
                user = query_user_by_userid(user_info[2])
                res_dict = {
                    "count": 1,
                    "user_id": user_info[2],
                    "is_new": 0,
                    "user_info": user.getinfo()
                }

        elif user_info[1]:
            # 用户未注册，创建新用户
            res_dict = {
                "count": 1,
                "user_id": user_info[2],
                "is_new": 1
            }

        else:
            # 检测失败(因为各种各样的原因)
            res_dict = {
                "count": 0
            }
    except Exception as e:
        print(e)
        print(
            "save the face jpg file failed!"
        )
        return None

    try:
        # 返回字符串化结果字典
        return json.dumps(res_dict)

    except Exception as e:
        print("error: {}\n failed to detect face and return the result!".format(e))
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
    # app.run(debug=True, host="0.0.0.0")
    app.run(debug=True)
