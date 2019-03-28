import serial
import pymysql


config = {
    'host': '139.217.8.185',
    'port': 3306,
    'user': 'noob',
    'password': '123',
    'database': 'ScrumFaceDetect',
    # 'charset': 'utf-8',
}

card_dict = {
    "A177FC4B": 1,
    "C96363F3": 2,
    "E94999F2": 2,
    "D1EE2970": 1,
}


ser = serial.Serial('com3', 9600)
data = ''
while 1:

    while ser.inWaiting() > 0:
        card_id = str(ser.read(12))[3:][:-1].replace(' ', '')
        print(card_id)
        try:
            # 连接数据库
            db = pymysql.connect(**config)
            cursor = db.cursor()
            sql_str = 'SELECT * FROM shopping_record WHERE card_id = "{}"'.format(card_id)
            count = cursor.execute(sql_str)
            print(count)
            if count:
                sql_str = 'DELETE FROM shopping_record WHERE card_id = "{}"'.format(card_id)
            else:
                sql_str = 'insert into shopping_record(card_id, good_id) values("{}","{}")'.\
                    format(card_id, card_dict[card_id])
            cursor.execute(sql_str)
            db.commit()
            cursor.close()
            db.close()
        except Exception as e:
            print(e)
            print('commit error')
            db.rollback()
            db.close()


