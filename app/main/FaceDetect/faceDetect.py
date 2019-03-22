# -*- coding: utf-8 -*-
import urllib.request
import urllib.error
import time
import json
# from sqlalchemy import Column, String, create_engine
# from sqlalchemy.orm import sessionmaker
# from sqlalchemy.ext.declarative import declarative_base
from app.main.dbapi import *

key = "OCfvZCSf72p8WPptTdW_nv2rwQa10i_x"
secret = "TATBECgI3LMRuPVLLB15GtTvpqc3pbOY"
faceset_token = "a95b184fd0011a44b3c18d553ff677f5"
boundary = '----------%s' % hex(int(time.time() * 1000))  # boundary为自定义的分隔符，用于分割数据

# # 创建对象的基类:
# Base = declarative_base()


# # 定义User对象:
# class User(Base):
#     # 表的名字:
#     __tablename__ = 'user_info'
#
#     # 表的结构:
#     user_id = Column(String(11), primary_key=True)
#     biomarker = Column(String(255))
#     name = Column(String(255))
#     sex = Column(String(255))
#     age = Column(String(255))
#     occupation = Column(String(255))
#     phone_num = Column(String(255))
#     other1 = Column(String(255))
#     other2 = Column(String(255))
#     other3 = Column(String(255))


# # 初始化数据库连接:
# engine = create_engine('mysql+pymysql://root:1234@localhost:3306/scrumfacedetect')
# # 创建DBSession类型:
# DBSession = sessionmaker(bind=engine)


def create_faceset():
    '''
    新建faceset
    :return:
    '''
    http_url = 'https://api-cn.faceplusplus.com/facepp/v3/faceset/create'

    data = []
    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'api_key')
    data.append(key)

    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'api_secret')
    data.append(secret)

    data.append('--%s--\r\n' % boundary)

    for i, d in enumerate(data):
        if isinstance(d, str):
            data[i] = d.encode('utf-8')

    http_body = b'\r\n'.join(data)
    req = urllib.request.Request(url=http_url, data=http_body)
    req.add_header('Content-Type', 'multipart/form-data; boundary=%s' % boundary)

    try:
        resp = urllib.request.urlopen(req, timeout=5)
        qrcont = resp.read()
        print(qrcont.decode('utf-8'))

        # 获取操作成功后faceset状态
        fsdata = json.loads(qrcont.decode('utf-8'))
        faceset = fsdata['faceset_token']
        print("人脸集合创建成功: " + faceset)
        return True

    except urllib.error.HTTPError as e:
        print(e.read().decode('utf-8') + "\n人脸集合创建失败！")
        return False

def remove_all_faces():
    '''
    删除一个faceset中的所有人脸
    :return: null
    '''
    http_url = 'https://api-cn.faceplusplus.com/facepp/v3/faceset/removeface'

    data = []
    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'api_key')
    data.append(key)

    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'api_secret')
    data.append(secret)

    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'faceset_token')
    data.append(faceset_token)

    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'face_tokens')
    data.append("RemoveAllFaceTokens")

    data.append('--%s--\r\n' % boundary)

    for i, d in enumerate(data):
        if isinstance(d, str):
            data[i] = d.encode('utf-8')

    http_body = b'\r\n'.join(data)
    req = urllib.request.Request(url=http_url, data=http_body)
    req.add_header('Content-Type', 'multipart/form-data; boundary=%s' % boundary)

    try:
        resp = urllib.request.urlopen(req, timeout=5)
        qrcont = resp.read()
        print(qrcont.decode('utf-8'))

        # 获取操作成功后faceset状态
        fsdata = json.loads(qrcont.decode('utf-8'))
        face_count = fsdata['face_count']
        print("人脸删除成功！\nfaceset中的人脸数量: " + str(face_count))
        return True

    except urllib.error.HTTPError as e:
        print(e.read().decode('utf-8') + "\n人脸删除失败！")
        return False


def remove_face(face_t):
    # 删除集合中的相应人脸
    http_url = 'https://api-cn.faceplusplus.com/facepp/v3/faceset/removeface'

    data = []
    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'api_key')
    data.append(key)

    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'api_secret')
    data.append(secret)

    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'faceset_token')
    data.append(faceset_token)

    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'face_tokens')
    data.append(face_t)

    data.append('--%s--\r\n' % boundary)

    for i, d in enumerate(data):
        if isinstance(d, str):
            data[i] = d.encode('utf-8')

    http_body = b'\r\n'.join(data)
    req = urllib.request.Request(url=http_url, data=http_body)
    req.add_header('Content-Type', 'multipart/form-data; boundary=%s' % boundary)

    try:
        resp = urllib.request.urlopen(req, timeout=5)
        qrcont = resp.read()
        # print(qrcont.decode('utf-8'))

        # 获取操作成功后faceset状态
        fsdata = json.loads(qrcont.decode('utf-8'))
        face_count = fsdata['face_count']
        print("人脸删除成功！\nfaceset中的人脸数量: " + str(face_count))
        return True

    except urllib.error.HTTPError as e:
        print(e.read().decode('utf-8') + "\n人脸删除失败！")
        return False


# 上传已检测face_token至faceset
def face_token_upload(face_token):
    http_url = 'https://api-cn.faceplusplus.com/facepp/v3/faceset/addface'

    data = []
    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'api_key')
    data.append(key)

    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'api_secret')
    data.append(secret)

    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'faceset_token')
    data.append(faceset_token)

    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'face_tokens')
    data.append(face_token)

    data.append('--%s--\r\n' % boundary)

    for i, d in enumerate(data):
        if isinstance(d, str):
            data[i] = d.encode('utf-8')

    http_body = b'\r\n'.join(data)
    req = urllib.request.Request(url=http_url, data=http_body)
    req.add_header('Content-Type', 'multipart/form-data; boundary=%s' % boundary)

    try:
        resp = urllib.request.urlopen(req, timeout=5)
        qrcont = resp.read()
        # print(qrcont.decode('utf-8'))

        # 获取操作成功后faceset状态
        fsdata = json.loads(qrcont.decode('utf-8'))
        face_count = fsdata['face_count']
        print("新用户人脸上传成功！\nfaceset中的人脸数量: " + str(face_count))
        return True

    except urllib.error.HTTPError as e:
        print(e.read().decode('utf-8') + "\n新用户人脸上传失败！")
        return False


def face_search(filepath):
    """
    新未知人脸在faceset中搜索，判断是否属于已知用户
    :param filepath: 图片文件的相对路径
    :return: 如果找到了已经存在的用户，返回形如list[True,False,user_id,name,gender,age,phone_number]的列表
                      如果图片中有多张人脸，则返回[True,True],提示重新拍照
                       若没有找到则返回list[False,True,user_id],user_id为新创建的用户的id
                       若检测失败(因为网络问题或者没有检测到人脸)，则返回list[False,False]
    """
    #  1、检测人脸，获取face_token
    http_url = 'https://api-cn.faceplusplus.com/facepp/v3/search'

    data = []
    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'api_key')
    data.append(key)

    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'api_secret')
    data.append(secret)

    data.append('--%s' % boundary)
    fr = open(filepath, 'rb')
    data.append('Content-Disposition: form-data; name="%s"; filename=" "' % 'image_file')
    data.append('Content-Type: %s\r\n' % 'application/octet-stream')  # 其中的MIME类型表示二进制数据流，未知下载类型
    data.append(fr.read())
    fr.close()

    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'faceset_token')
    data.append(faceset_token)

    data.append('--%s--\r\n' % boundary)

    for i, d in enumerate(data):
        if isinstance(d, str):
            data[i] = d.encode('utf-8')


    http_body = b'\r\n'.join(data)
    req = urllib.request.Request(url=http_url, data=http_body)
    req.add_header('Content-Type', 'multipart/form-data; boundary=%s' % boundary)

    new_face_token = 'no'
    likely_face_token = 'no'
    try:
        print("发送请求！！")
        resp = urllib.request.urlopen(req, timeout=5)
        qrcont = resp.read()
        print(qrcont.decode('utf-8'))

        # 获取搜索结果
        res = json.loads(qrcont.decode('utf-8'))
        if (len(res["faces"]) > 1):
            uf = [True, True]
            return uf

        min = res['thresholds']['1e-3']
        max = res['thresholds']['1e-5']
        conf = res["results"][0]["confidence"]
        new_face_token = res["faces"][0]["face_token"]
        likely_face_token = res["results"][0]["face_token"]

    except BaseException as e:
        uf = [False, False]
        print("网络错误！")
        return uf

    if (new_face_token == 'no'):
        uf = [False, False]
        print("没检测到人脸")
        return uf

    else:
        if (conf <= min):
            # print("未搜索到已存在用户！\n新face_token为： " + new_face_token)
            # 上传新的face_token并保存到数据库
            flag = face_token_upload(new_face_token)
            assert flag == True, "新face_token上传失败"

            # =========mysql写入新用户信息
            # mycursor.execute(sql, val)
            # face_db.commit()  # 数据表内容有更新，必须使用到该语句
            # assert mycursor.rowcount == 1, "新用户上传失败"

            # 创建Session:
            session = get_session()
            sql = "INSERT INTO user_info (biomarker) VALUES ('%s')" % (new_face_token)
            result = session.execute(sql)
            session.commit()
            user_info = [False, True, result.lastrowid]
            print(user_info)
            # 关闭Session:
            session.close()
            return user_info

        if (conf >= max):
            print("搜索到已存在用户！\nface_token为: " + likely_face_token)
            # =========mysql获取用户信息
            # mycursor = face_db.cursor()
            # sql = "SELECT * FROM user_info WHERE biomarker = \'" + likely_face_token + "\'"
            # mycursor.execute(sql)
            # myresult = mycursor.fetchall()

            # #人脸删除
            # remove_face(likely_face_token)

            # 创建Session:
            session = get_session()
            # 创建Query查询，filter是where条件，最后调用one()返回唯一行，如果调用all()则返回所有行:
            user = session.query(User).filter(User.biomarker == likely_face_token).one()
            print(user.user_id)
            user_info = [True, False, user.user_id, user.name, user.sex, user.age, user.phone_num]
            print(user_info)
            # 关闭Session:
            session.close()
            return user_info

            try:
                user = session.query(User).filter(User.biomarker == likely_face_token).one()
                user_info = [True, False, user.user_id, user.name, user.sex, user.age, user.phone_num]
                print(user_info)
                # 关闭Session:
                session.close()
                return user_info

            except BaseException as e:
                print("逻辑错误！faceset中搜索到已存在用户！数据库中未搜索到匹配用户，请手动加入！")
                uf = [False, False]
                return uf


def face_upload(filepath):
    # 以每个用户一张人脸上传保存至faceset
    #  1、检测人脸，获取face_token
    http_url = 'https://api-cn.faceplusplus.com/facepp/v3/detect'

    data = []
    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'api_key')
    data.append(key)

    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'api_secret')
    data.append(secret)

    data.append('--%s' % boundary)
    fr = open(filepath, 'rb')
    data.append('Content-Disposition: form-data; name="%s"; filename=" "' % 'image_file')
    data.append('Content-Type: %s\r\n' % 'application/octet-stream')  # 其中的MIME类型表示二进制数据流，未知下载类型
    data.append(fr.read())
    fr.close()

    data.append('--%s' % boundary)
    data.append('Content-Disposition: form-data; name="%s"\r\n' % 'return_landmark')
    data.append('0')  # 不返回关键点信息

    data.append('--%s--\r\n' % boundary)

    for i, d in enumerate(data):
        if isinstance(d, str):
            data[i] = d.encode('utf-8')

    http_body = b'\r\n'.join(data)
    req = urllib.request.Request(url=http_url, data=http_body)
    req.add_header('Content-Type', 'multipart/form-data; boundary=%s' % boundary)

    face_token = 'no'
    try:
        resp = urllib.request.urlopen(req, timeout=5)
        qrcont = resp.read()
        print(qrcont.decode('utf-8'))

        # 提取face_token
        fdata = json.loads(qrcont.decode('utf-8'))
        face_token = fdata['faces'][0]['face_token']
        print("face_token: " + face_token)

    except urllib.error.HTTPError as e:
        print(e.read().decode('utf-8'))

    if face_token == 'no':
        print('人脸检测失败!')
        return False
    else:
        #  2、将face_token上传至faceset
        flag = face_token_upload(face_token)
        return flag


def main():
    new_face = r"/Users/yeshuai/Documents/实训/face_rec/user_face/9.jpg"
    # # face_for_search = r"/Users/yeshuai/Documents/实训/face_rec/faces_repeated/14.jpg"
    user_info = face_search(new_face)
    # remove_face('590ac00b69a0e4e59a7a9ad9150d1ad8')
    # remove_all_faces();
    # face_upload(new_face)
    # create_faceset()


if __name__ == '__main__':
    main()
