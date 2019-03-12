#!/usr/bin/env python 
# -*- coding:utf-8 -*-
from app.main.DataAnalysis.Func.CFR import calculateSpecificSimilarItems, getRecommendations
from app.main.DataAnalysis.Func.obtain_dataset import *
from app.main.DataAnalysis.Func.handle_dataset import *

# 获取数据集的字典
ObtainDatasetFunc = {
    1: obtain_dataset,
    2: splitDatasetByQuarter,
    3: splitDatasetByHotCommodityDistribution
}

# 获取兴趣度字典的字典
ObtainPrefsFunc = {
    1: obtain_prefs_from_database,
    2: obtain_prefs_from_json
}


# 商品推荐
def multiple_recommendation(func_id=1):
    """

    :param obtain_dataset_func:
    obtain_dataset 常规推荐
    splitDatasetByQuarter 季节性商品推荐
    splitDatasetByHotCommodityDistribution 热点商品推荐
    :return:
    """
    dataset = ObtainDatasetFunc[func_id]()
    ranking_first = obtain_ranking_first(dataset)
    prefs = handle_dataset(dataset)
    itemMatch = calculateSpecificSimilarItems(prefs, ranking_first, n=5)
    ranking = [item[1] for item in itemMatch]
    return ranking


# 获得个性化推荐序列
def personalized_recommendation(user_id, func_id=1):
    """

    :param user_id:
    :return ranking:
    """
    prefs = ObtainPrefsFunc[1]()
    # 根据所给数据集通过推荐算法得到推荐序列
    ranking_str = getRecommendations(prefs, row_name=user_id)
    # 推荐序列的数值化
    ranking = [int(item[1]) for item in ranking_str]
    return ranking[0:5]