#!/usr/bin/env python 
# -*- coding:utf-8 -*-
import datetime


# 返回当前季度
def currentQuarter(date_now):
    """

    :param date_now: 需要转换的日期
    :return id:当前季度id
    """
    if (date_now.month > 2 and date_now.month < 6): return 1
    if (date_now.month > 5 and date_now.month < 9): return 2
    if (date_now.month > 8 and date_now.month < 12): return 3
    return 4


# 返回去年季度的起止日期
def quarterlyCommodityAnalysis_dateRange():
    """

    :return datetime:起止日期
    """
    date_now = datetime.datetime.now()
    last_year = date_now.year - 1
    current_quarter = currentQuarter(date_now)
    last_year_quarters = {
        1: {'date_start': datetime.datetime.strptime('%d-03-01 00:00:00' % last_year, '%Y-%m-%d %H:%M:%S'),
            'date_end': datetime.datetime.strptime('%d-05-31 23:59:59' % last_year, '%Y-%m-%d %H:%M:%S')},
        2: {'date_start': datetime.datetime.strptime('%d-06-01 00:00:00' % last_year, '%Y-%m-%d %H:%M:%S'),
            'date_end': datetime.datetime.strptime('%d-08-31 23:59:59' % last_year, '%Y-%m-%d %H:%M:%S')},
        3: {'date_start': datetime.datetime.strptime('%d-09-01 00:00:00' % last_year, '%Y-%m-%d %H:%M:%S'),
            'date_end': datetime.datetime.strptime('%d-11-30 23:59:59' % last_year, '%Y-%m-%d %H:%M:%S')},
        4: {'date_start': datetime.datetime.strptime('%d-12-01 00:00:00' % last_year, '%Y-%m-%d %H:%M:%S'),
            'date_end': datetime.datetime.strptime('%d-02-28 23:59:59' % date_now.year, '%Y-%m-%d %H:%M:%S')}}
    return last_year_quarters[current_quarter]['date_start'], last_year_quarters[current_quarter]['date_end']


# 返回当前以前3个月的起止日期
def hotCommodityDistributionAnalysis_dateRange():
    """

    :return datetime:起止日期
    """
    import datetime
    date_now = datetime.datetime.now()
    date_start = date_now - datetime.timedelta(days=90)
    return date_start, date_now
