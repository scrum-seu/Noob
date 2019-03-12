#!/usr/bin/env python 
# -*- coding:utf-8 -*-
from app.main.dbapi import query_purchase_history_orderby_purchase_date
from app.main.DataAnalysis.Func.date_range import *
from app.main.DataAnalysis.Func.handle_dataset import handle_dataset
import json


# 从数据库获得数据集
def obtain_dataset():
    dataset = query_purchase_history_orderby_purchase_date()
    return dataset


# 根据季节分割数据集
def splitDatasetByQuarter():
    dataset = obtain_dataset()
    date_start, date_end = quarterlyCommodityAnalysis_dateRange()
    return_dataset = [item for item in dataset if item.purchase_date >= date_start and item.purchase_date <= date_end]
    return return_dataset


# 根据热销商品分割数据集
def splitDatasetByHotCommodityDistribution():
    dataset = obtain_dataset()
    date_start, date_end = hotCommodityDistributionAnalysis_dateRange()
    return_dataset = [item for item in dataset if item.purchase_date >= date_start and item.purchase_date <= date_end]
    return return_dataset


# 获得数据集对应排序首位的id
def obtain_ranking_first(dataset):
    """

    :param dataset:
    :return item:
    """
    ranking = {}
    for item in dataset:
        if (item.good_id not in ranking.keys()):
            ranking.setdefault(item.good_id, 1)
        else:
            ranking[item.good_id] += 1
    ranking_order = sorted(ranking.items(), key=lambda item: item[1], reverse=True)
    return ranking_order[0][0]


# 从.json文件获得兴趣度字典
def obtain_prefs_from_json():
    with open('static/js/prefs.json', 'r', encoding='utf-8') as file:
        prefs = json.load(file)
    return prefs


# 从数据库分析获得兴趣度字典
def obtain_prefs_from_database():
    dataset = obtain_dataset()
    prefs = handle_dataset(dataset)
    return prefs