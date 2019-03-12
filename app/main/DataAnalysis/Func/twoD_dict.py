#!/usr/bin/env python 
# -*- coding:utf-8 -*-

# 返回每个顾客各个商品的累计购买次数
def addtwodimdict(object_dict, key, sub_key):
    """

    :param object_dict:
    :param key:
    :param sub_key:
    :return:
    """
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


# 二维字典值点除一维字典值
def TD_dot_divide_OD(TD, OD):
    for key in TD:
        if type(TD[key]).__name__ == 'dict':
            for sub_key in TD[key]:
                TD[key][sub_key] = round(TD[key][sub_key] / OD[key], 2)
        else:
            TD[key] = round(TD[key] / OD[key], 2)


# 二维字典值点乘标量值
def TD_dot_multiply_ZD(TD, ZD=5):
    for key in TD:
        if type(TD[key]).__name__ == 'dict':
            for sub_key in TD[key]:
                TD[key][sub_key] = TD[key][sub_key] * ZD
        else:
            TD[key] = TD[key] * ZD
