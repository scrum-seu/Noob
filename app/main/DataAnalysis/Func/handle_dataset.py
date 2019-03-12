#!/usr/bin/env python 
# -*- coding:utf-8 -*-
from app.main.DataAnalysis.Func.twoD_dict import *
from app.main.DataAnalysis.Func.json_os import write_to_json
from app.models.models import Purchase_history


# 数据集清洗并提炼关键信息
def handle_dataset(dataset):
    """

    :param dataset:
    :return:
    """
    purchase_times = {}
    prefs = {}
    prev = Purchase_history()
    # 获取各个顾客的购物次数
    for item in dataset:
        if (item.user_id not in purchase_times.keys()):
            purchase_times.setdefault(item.user_id, 1)
        elif (item.user_id != prev.user_id):
            purchase_times[item.user_id] += 1
        prev = item
    # 获取各个顾客各个商品的购买次数
    for item in dataset:
        addtwodimdict(prefs, item.user_id, item.good_id)
    # 计算各个顾客各个商品的购买频率
    TD_dot_divide_OD(prefs, purchase_times)
    # 便于计算将结果放大
    TD_dot_multiply_ZD(prefs)
    # 将兴趣度矩阵存入.json文件
    write_to_json(prefs)
    return prefs
