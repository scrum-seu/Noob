#!/usr/bin/env python 
# -*- coding:utf-8 -*-
from app.main.DataAnalysis.Func.twoD_dict import *
from app.main.DataAnalysis.Func.obtain_dataset import obtain_dataset
from app.main.DataAnalysis.Func.json_os import write_to_json
from app.models.models import Purchase_history


# 补偿函数
def compensation_function(item):
    if (item < 0.2):
        return 0
    elif (item < 0.4):
        return 1
    elif (item < 0.6):
        return 2
    elif (item < 0.8):
        return 2.5
    else:
        return 3


# 提取数据集中的价值因素
def handle_dataset_with_price(dataset):
    eachTimeCost = {}
    # 计算每一位顾客每次购买所花费的总金额
    for item in dataset:
        addTwoDimDict(eachTimeCost, item.user_id, item.purchase_date, item.total_price)
    return eachTimeCost


# 用价值比重对兴趣度字典进行补偿
def handle_prefs_with_price(dataset, prefs):
    eachTimeCost = handle_dataset_with_price(dataset)
    for item in dataset:
        compensation_item = item.total_price / eachTimeCost[item.user_id][item.purchase_date]
        prefs[item.user_id][item.good_id] += compensation_function(compensation_item)


# 数据集清洗并提炼关键信息
def handle_dataset(dataset):
    """

    :param dataset:
    :return prefs:
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
        addTwoDimDict(prefs, item.user_id, item.good_id)
    # 便于计算将结果放大
    TD_dot_multiply_ZD(prefs)
    # 价值补偿
    handle_prefs_with_price(dataset, prefs)
    # 计算各个顾客各个商品的购买频率
    TD_dot_divide_OD(prefs, purchase_times)
    # 将兴趣度矩阵存入.json文件
    # write_to_json(prefs)
    return prefs


if __name__ == '__main__':
    dataset = obtain_dataset()
    print(handle_dataset(dataset))
