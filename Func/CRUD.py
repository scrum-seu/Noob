#!/usr/bin/env python 
# -*- coding:utf-8 -*-

from app import Purchase_history


def insert(db):
    purchase_history_record = Purchase_history()
    db.session.add(purchase_history_record)
    db.commit()


def select(db):
    purchase_history_list = Purchase_history.query.all()
    print(purchase_history_list)


if __name__ == '__main__':
    pass
