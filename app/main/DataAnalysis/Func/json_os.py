#!/usr/bin/env python 
# -*- coding:utf-8 -*-

import json


# 将数据写入.json文件，保证算法效率
def write_to_json(prefs):
    with open('static/js/prefs.json', 'w', encoding='utf-8') as file:
        json.dump(prefs, file, indent=4)
