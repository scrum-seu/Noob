from flask import Flask, render_template, request
from flask import render_template
from app.main.dbapi import *
import pymysql
from decimal import *
from datetime import timedelta
app = Flask(__name__)
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = timedelta(seconds=1)
app.config['PERMANENT_SESSION_LIFETIME'] = timedelta(seconds=1)
@app.route('/')
def demo():
    return render_template("index.html")

'''
1.注册信息接收
2.查询商品信息和价格发送给前台
'''
@app.route('/login', methods=["GET", "POST"])
def login():
    #获取id,name,price字段
    u = [(good.good_id, good.name, good.price) for good in query_goods()]
    goodnum = len(u)
    testlist = []
    '''
    1.信息转换成字符串发送到前台
    '''
    for i in range(goodnum):
        testlist.append([])
        testlist[i].append(str(u[i][0]))
        testlist[i].append(u[i][1].replace(" ", ""))
        m = str(Decimal(u[i][2]).quantize(Decimal('0.0')))
        testlist[i].append(m)
    new=[]
    for i in range(goodnum):
        new.append(" ".join(testlist[i]))
    final = " ".join(new)
    print(final)
    if request.method == "POST":
        data = request.get_json()
        for key in data:
            print(key + ':' + data[key])
        return(final)
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
        #预留调用用户分析模块
        return ("hello")
    else:
        return render_template("login.html")
if __name__ == '__main__':
    app.run(debug=True)



