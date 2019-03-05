#!/usr/bin/env python 
# -*- coding:utf-8 -*-

import json


def write_to_json(prefs):
    with open('../app/main/static/prefs.json', 'w', encoding='utf-8') as file:
        json.dump(prefs, file, indent=4)
