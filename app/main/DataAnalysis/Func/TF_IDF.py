#!/usr/bin/env python 
# -*- coding:utf-8 -*-
from app.main.DataAnalysis.Func.json_os import *
from app.main.DataAnalysis.Func.obtain_dataset import obtain_dataset
from app.main.DataAnalysis.Func.twoD_dict import twoDimDictInit,TD_dot_divide_OD
import datetime
from math import exp


# 从数据集获取日标签个数
def daily_category_statistics_by_dataset(dataset):
    """

    :param dataset: 数据集
    :return dict: 日标签字典
    """
    dict = {}
    for item in dataset:
        twoDimDictInit(dict, str(item.purchase_date)[0:10], str(item.category_id))
    return dict


# 从json文件获取日销售商品类别
def daily_category_statistics_by_json():
    with open('static/json/daily_category_statistics.json', 'r', encoding='utf-8') as file:
        dict = json.load(file)
    return dict


def TF(dataset, user_id):
    """

    :param dataset: 数据集
    :param user_id: 顾客id
    :return TF(P,T): TF算法后的标签字典
    """
    # 各个顾客不同时间段的标签权重
    TF_dict = {}
    # 各个顾客不同时间段各个类别的购买次数
    tag_dict = {}
    # 各个顾客不同时间段身上的标签总数
    tag_sum_dict = {}
    # 获取各个顾客每次购买各个标签的权重
    for item in dataset:
        if user_id == item.user_id:
            twoDimDictInit(TF_dict, item.purchase_date, item.category_id, value=item.action_id)
    # 获取各个顾客每次购买各个标签的个数
    for item in dataset:
        if user_id == item.user_id:
            twoDimDictInit(tag_dict, item.purchase_date, item.category_id)
    # 获取各个顾客每次购买的全部标签个数
    for key in tag_dict:
        sum = 0
        for sub_key in tag_dict[key]:
            sum += tag_dict[key][sub_key]
        tag_sum_dict[key] = sum
    TD_dot_divide_OD(TF_dict, tag_sum_dict)
    return TF_dict


def IDF(dataset):
    """

    :param dataset: 数据集
    :return IDF(P,T): IDF算法后的标签字典
    """
    # 不同时间段的标签个数
    IDF_dict = {}
    # 不同时间段的标签个数
    daily_category_statistics = daily_category_statistics_by_dataset(dataset)
    for key in daily_category_statistics:
        sum = 0
        for sub_key in daily_category_statistics[key]:
            sum += daily_category_statistics[key][sub_key]
        for sub_key in daily_category_statistics[key]:
            if key in IDF_dict:
                IDF_dict[key].update({sub_key: sum / daily_category_statistics[key][sub_key]})
            else:
                IDF_dict.update({key: {sub_key: sum / daily_category_statistics[key][sub_key]}})
    return IDF_dict


# 该顾客每个标签的TF-IDF权重
def TF_IDF(dataset, user_id):
    """

    :param dataset: 数据集
    :param user_id: 顾客id
    :return TF_IDF_dict: TF-IDF算法后的标签字典
    """
    TF_IDF_dict = TF(dataset, user_id)
    IDF_dict = IDF(dataset)
    for date_key in TF_IDF_dict:
        str_key = str(date_key)[0:10]
        for sub_key in TF_IDF_dict[date_key]:
            TF_IDF_dict[date_key][sub_key] *= IDF_dict[str_key][str(sub_key)]
    return TF_IDF_dict


# 牛顿冷却模型
# F(t)=初始温度×exp(-冷却系数×间隔的时间)
def cooling_model(object_dict):
    """

    :param object_dict: 目标字典
    :return result_list: 结果列表
    """
    # 冷却系数
    cooling_factor = -0.023
    # 返回字典
    result_dict = {}
    # 当前日期
    today = datetime.datetime.today()
    for key in object_dict:
        delta = today - key
        for sub_key in object_dict[key]:
            # 根据牛顿冷却定律计算标签热度
            object_dict[key][sub_key] *= exp(cooling_factor * delta.days)
            # 标签求和
            if sub_key in result_dict:
                result_dict[sub_key] += object_dict[key][sub_key]
            else:
                result_dict.update({sub_key: object_dict[key][sub_key]})
    # 从返回字典获取结果列表
    result_list = [(result_dict[key], key) for key in result_dict]
    result_list.sort()
    result_list.reverse()
    return result_list


# 用户标签权重算法
def tag_weight_algorithm(dataset, user_id):
    TF_IDF_list = TF_IDF(dataset, user_id)
    tag_weight_tuple = cooling_model(TF_IDF_list)
    tag_weight_list = [item[1] for item in tag_weight_tuple]
    return tag_weight_list[0:2]


if __name__ == '__main__':
    dataset = obtain_dataset()
    print(tag_weight_algorithm(dataset, 6))
