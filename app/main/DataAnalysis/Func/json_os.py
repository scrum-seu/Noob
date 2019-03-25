#!/usr/bin/env python 
# -*- coding:utf-8 -*-

# from app.main.dbapi import query_goods_info
import json


# 将数据写入.json文件，保证算法效率
def write_to_json(dict, filename):
    """

    :param dict: 需要写入.json文件的字典
    """
    with open('../../static/json/%s.json' % filename, 'w', encoding='utf-8') as file:
        json.dump(dict, file, indent=4)


# if __name__ == '__main__':
#     goods_info_list = query_goods_info()
#     dict = {}
#     for item in goods_info_list:
#         dict[item.good_id] = int(item.category)
#     write_to_json(dict, 'goods_category')
