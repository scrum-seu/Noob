#!/usr/bin/env python 
# -*- coding:utf-8 -*-
from app.main.DataAnalysis.Func.CFR import *
from app.main.DataAnalysis.Func.obtain_dataset import *
from app.main.DataAnalysis.Func.handle_dataset import handle_dataset
from app.main.DataAnalysis.Func.TF_IDF import tag_weight_algorithm

# 获取数据集的字典
ObtainDatasetFunc = {
    1: obtain_dataset,
    2: splitDatasetByQuarter,
    3: splitDatasetByHotCommodityDistribution
}


# 商品推荐
def multiple_recommendation(func_id=1):
    """

    :param obtain_dataset_func:
    obtain_dataset 常规推荐
    splitDatasetByQuarter 季节性商品推荐
    splitDatasetByHotCommodityDistribution 热点商品推荐
    :return ranking: 推荐列表
    """
    dataset = ObtainDatasetFunc[func_id]()
    ranking_first = obtain_ranking_first(dataset)
    prefs = handle_dataset(dataset)
    itemMatch = calculateSpecificSimilarItems(prefs, ranking_first, n=5)
    ranking = [item[1] for item in itemMatch]
    return ranking


# 获得个性化推荐序列
def personalized_recommendation(user_id):
    """

    :param user_id: 顾客id
    :return ranking: 推荐列表
    """
    # 从数据库获取数据集
    dataset = obtain_dataset()
    # 通过兴趣度算法获取用户兴趣度字典
    prefs = handle_dataset(dataset)
    # 通过标签权重算法获得用户感兴趣的商品类别
    tag_weight_list = tag_weight_algorithm(dataset, user_id)
    # 从.json文件读取商品类别
    with open('static/json/goods_category.json', 'r', encoding='utf-8') as file:
        category_dict = json.load(file)
    # 利用相似物品推荐相似物品
    itemMatch = calculateSimilarItems(prefs)  # 提前计算所有物品的相似物品
    ranking_dict = getRecommendedItems(prefs, itemMatch, row_name=user_id)
    if ranking_dict:
        return []
    for item in ranking_dict:
        if category_dict[str(item)] in tag_weight_list:
            ranking_dict[item] *= 1.25
    # # 利用相似顾客推荐相似物品
    # ranking_dict = getRecommendations(prefs, row_name=user_id)
    # 推荐序列的元组化
    ranking_tuple = [(ranking_dict[key], key) for key in ranking_dict]
    # 按最高值到最低值的顺序，返回估值排行
    ranking_tuple.sort()
    ranking_tuple.reverse()
    # 推荐元组的列表化
    ranking = [item[1] for item in ranking_tuple]
    return ranking[0:5]


if __name__ == '__main__':
    print(personalized_recommendation(111))
