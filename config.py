# -*- coding: utf-8 -*-
# Author: Noob
import os

basedir = os.path.abspath(os.path.dirname(__file__))
mysql_config = {
    'Database': 'mysql',
    'dataconnector': 'pymysql',
    'admin': 'root',
    'password': '1234',
    'ip': 'localhost',
    'port': '3306',
    'database': 'ScrumFaceDetect',
    'charset': 'utf8'
}


class Config(object):   # 所有配置类的父类，通用的配置写在这里
    # SQLALCHEMY_COMMIT_ON_TEARDOWN = True
    # SQLALCHEMY_TRACK_MODIFICATIONS = True

    @staticmethod
    def init_app(app):  # 静态方法作为配置的统一接口，暂时为空
        pass


class DevelopmentConfig(Config):    # 开发环境配置类
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = \
        "mysql+pymysql://root:123456Ys@10.6.207.166:3306/ScrumFaceDetect?charset=utf8"


class TestingConfig(Config):    # 测试环境配置类
    TESTING = True
    SQLALCHEMY_DATABASE_URI = \
        "mysql+pymysql://ScrumFaceDetect:root@10.6.207.166:3306/ScrumFaceDetect"


class ProductionConfig(Config):     # 生产环境配置类
    SQLALCHEMY_DATABASE_URI = \
        "mysql+pymysql://ScrumFaceDetect:root@10.6.207.166:3306/ScrumFaceDetect"


config = {  # config字典注册了不同的配置，默认配置为开发环境，本例使用开发环境
    'development': DevelopmentConfig,
    'testing': TestingConfig,
    'production': ProductionConfig,
    'default': DevelopmentConfig
}



