# -*- coding: utf-8 -*-
import os
import json
import pymysql

DEBUG = True

_author = "Noob"

db_config = {
  "host": "10.6.207.166",
  "port": 3306,
  "user": "root",
  "passwd": "123456Ys",
   "database": "ScrumFaceDetect",
}


class RawMysql(object):
    def __init__(self, host="", port=3306, user="", passwd="", db=""):
        try:
            self.sql = u""
            if host != "":
                self.host = host
                self.port = port
                self.user = user
                self.passwd = passwd
                self.db = db
                self.connect = pymysql.connect(host=host, port=port, user=user, passwd=passwd, db=db, charset='utf8')
            else:
                self.host = db_config['host']
                self.port = db_config['port']
                self.user = db_config['user']
                self.passwd = db_config['passwd']
                self.db = db if db != "" else db_config['database']
                self.connect = pymysql.connect(host=db_config['host'], port=db_config['port'], user=db_config['user'],
                                               passwd=db_config['passwd'], db=db if db != "" else db_config['database'],
                                               charset='utf8')
            self.cursor = self.connect.cursor()
        except pymysql.Error as e:
            pass

    def __del__(self):
        self.connect.close()

    def query(self, size=1):
        """
        执行sql，返回记录数由size指定，默认为1，设置成0则全部返回
        :param size:返回的记录数，默认为1，为0时全部返回
        :return:返回查询结果记录集
        """
        self.cursor.execute(self.sql)
        if size == 1:
            return self.cursor.fetchone()
        else:
            return self.cursor.fetchmany(size=size) if size != 0 else self.cursor.fetchall()

    def update(self, args_tuple=()):
        """
        执行数据库更新操作，如插入删除等
        """
        try:
            self.cursor.execute(self.sql, args_tuple)
            self.connect.commit()
            return True
        except Exception as e:
            if DEBUG:
                print(e)
                print(self.sql)
            self.connect.rollback()
            exit(1)
            return False

    def update_many(self, args_list=None):
        """
        执行数据库批量DML操作，如批量插入
        :param args_list:需要传入一个列表，列表中的元素为包含传入参数的元组，sql为带占位符的sql
        """
        if args_list is None:
            args_list = []
        try:

            self.cursor.executemany(self.sql, args_list)
            self.connect.commit()
            return True
        except Exception as e:
            if DEBUG:
                print(e)
            self.connect.rollback()
            return False

    def re_connect(self):
        self.connect = pymysql.connect(host=self.host, port=self.port, user=self.user,
                                       passwd=self.passwd, db=self.db, charset='utf8')
        self.cursor = self.connect.cursor()


if __name__ == "__main__":
    db_mysql = RawMysql()
    db_mysql.sql = "select name from user_info;"
    print(db_mysql.query(10))
