#!/usr/bin/env python
# -*- coding:utf-8 -*-
from app.main.DataAnalysis.Func.twoD_dict import TD_dot_divide_OD, TD_dot_multiply_ZD
from app.main.DataAnalysis.Func.CFR import *
from app.main.DataAnalysis.Func.json_os import write_to_json
from app.main.dbapi import query_purchase_history_orderby_purchase_date
from app.models.models import Purchase_history
import json
import os


def addtwodimdict(object_dict, key, sub_key):
    if key in object_dict:
        if sub_key not in object_dict[key]:
            object_dict[key].update({sub_key: 1})
        else:
            object_dict[key][sub_key] += 1
    else:
        object_dict.update({key: {sub_key: 1}})


def obtain_prefs(user_id):
    if (os.path.exists('../app/main/static/prefs.json')):
        with open('../app/main/static/prefs.json', 'r', encoding='utf-8') as file:
            prefs = json.load(file)
        rankings = getRecommendations(prefs, row_name=str(user_id))
        return rankings
    else:
        purchase_history_list = query_purchase_history_orderby_purchase_date()
        prefs = {}
        purchase_frequency = {}
        purchase_times = {}
        prev = Purchase_history()
        for item in purchase_history_list:
            if (item.user_id not in purchase_times.keys()):
                purchase_times.setdefault(item.user_id, 1)
            elif (item.purchase_date != prev.purchase_date):
                purchase_times[item.user_id] += 1
            prev = item
        for item in purchase_history_list:
            addtwodimdict(prefs, item.user_id, item.good_id)
        TD_dot_divide_OD(prefs, purchase_times)
        TD_dot_multiply_ZD(prefs)
        write_to_json(prefs)
        rankings = getRecommendations(prefs, row_name=user_id)
        return rankings
