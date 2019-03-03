# -*- coding: utf-8 -*-
# Author: Noob
from flask import Flask
from config import config


def create_app(config_name):
    """
    factory function
    :param config_name:
    :return:
    """
    app = Flask(__name__)
    app.config.from_object(config[config_name])
    config[config_name].init_app(app)  # 通过config.py统一接口

    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)

    return app


config_name = "development"
app = Flask(__name__)
# app.config.from_object(config[config_name])
# config[config_name].init_app(app)  # 通过config.py统一接口

from .main import main as main_blueprint
app.register_blueprint(main_blueprint)

from app.models import models