#!/usr/bin/env python
# -*- coding:utf-8 -*-
from Func.twoD_dict import TD_dot_divide_OD, TD_dot_multiply_ZD
from Func.CFR import *
from Func.json_os import write_to_json
from dbapi import query_purchase_history_orderby_purchase_date
from models import Purchase_history
import json
import os


# 计算未处理过的顾客兴趣度矩阵
def addtwodimdict(object_dict, key, sub_key):
    # 若矩阵存在当前顾客id
    if key in object_dict:
        # 若当前顾客的历史购买记录不存在此商品id
        if sub_key not in object_dict[key]:
            object_dict[key].update({sub_key: 1})
        # 存在则累加
        else:
            object_dict[key][sub_key] += 1
    # 矩阵不存在当前顾客id则初始化
    else:
        object_dict.update({key: {sub_key: 1}})


def obtain_prefs(user_id):
    ranking = []
    # 若已保存顾客兴趣度矩阵则直接从.json文件读取
    if (os.path.exists('static/js/prefs.json')):
        with open('static/js/prefs.json', 'r', encoding='utf-8') as file:
            prefs = json.load(file)
        # 通过推荐算法得到排序
        rankings = getRecommendations(prefs, row_name=str(user_id))
        # 通过排序得到推荐列表
        for item in rankings:
            ranking.append(int(item[1]))
        return ranking
    # 未存在顾客兴趣度矩阵
    else:
        # 映射对象列表
        purchase_history_list = query_purchase_history_orderby_purchase_date()
        prefs = {}
        purchase_times = {}
        prev = Purchase_history()
        # 获取各个顾客的购物次数
        for item in purchase_history_list:
            if (item.user_id not in purchase_times.keys()):
                purchase_times.setdefault(item.user_id, 1)
            elif (item.purchase_date != prev.purchase_date):
                purchase_times[item.user_id] += 1
            prev = item
        # 获取各个顾客各个商品的购买次数
        for item in purchase_history_list:
            addtwodimdict(prefs, item.user_id, item.good_id)
        # 计算各个顾客各个商品的购买频率
        TD_dot_divide_OD(prefs, purchase_times)
        # 便于计算将结果放大
        TD_dot_multiply_ZD(prefs)
        # 将兴趣度矩阵存入.json文件
        write_to_json(prefs)
        # 通过推荐算法得到推荐
        rankings = getRecommendations(prefs, row_name=user_id)
        return ranking
