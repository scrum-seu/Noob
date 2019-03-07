#!/usr/bin/env python 
# -*- coding:utf-8 -*-

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


if __name__ == '__main__':
    pass
