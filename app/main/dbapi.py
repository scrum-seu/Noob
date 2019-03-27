from app.models.models import get_session, User, Goods, Purchase_history, Goods_category, Goods_comment, Like_info

"""
==================================================================
==========================User Data Operation=====================
==================================================================
"""


def query_user(biomarker=""):
    """
    根据用户生物标志查找用户
    :param biomarker:
    :return: 包含用户信息的用户类
    """
    session = get_session()
    if "" != biomarker:
        users = session.query(User).filter(User.biomarker == biomarker).one()
    else:
        users = session.query(User).all()
    session.close()
    return users


def query_user_by_userid(user_id=-1):
    """
    根据用户id，查找用户, user_id = -1 返回所有用户
    :param user_id:
    :return:
    """
    session = get_session()
    if -1 != user_id:
        users = session.query(User).filter(User.user_id == user_id).one()
    else:
        users = session.query(User).all()
    session.close()
    return users


def add_user(biomarker, name=None, sex=None, age=None, occupation=None, phone_num=None,
             other1=None, other2=None, other3=None):
    """
    添加用户
    :return:
    """
    user = User(biomarker=biomarker, name=name, sex=sex, age=age, occupation=occupation,
                phone_num=phone_num, other1=other1, other2=other2, other3=other3)
    try:
        session = get_session()
        session.add(user)
        session.commit()
    except Exception:
        session.rollback()
        print("add user fail!!!")
        raise
    finally:
        session.close()


def update_user_info(user):
    """
    更新用户信息
    :param user:
    :return:
    """
    try:
        session = get_session()
        session.query(User).filter(User.user_id == user.user_id).update(user.getinfo())
        session.commit()
    except Exception:
        session.rollback()
        print("update user information fail!!!")
        raise
    finally:
        session.close()


def delete_user(user_id):
    """
    删除用户
    :param user_id:
    :return:
    """
    try:
        session = get_session()
        session.query(User).filter(User.user_id == user_id).delete()
        session.commit()
    except Exception:
        session.rollback()
        print("delete user fail!!!")
        raise
    finally:
        session.close()


"""
==================================================================
==========================Goods Data Operation=====================
==================================================================
"""


def query_goods(good_id=-1):
    """
    查询商品信息，如果goods_id == -1, 返回所有商品
    :param good_id:
    :return:
    """
    session = get_session()
    goods = session.query(Goods).all() if -1 == good_id \
        else session.query(Goods).filter(Goods.good_id == good_id).one()
    session.close()
    return goods


def add_goods(name, price, category=None, other2=None):
    """
    添加商品
    :return:
    """
    good = Goods(name=name, price=price, category=category, other2=other2)
    try:
        session = get_session()
        session.add(good)
        session.commit()
    except Exception:
        session.rollback()
        print("add goods fail!!!")
        raise
    finally:
        session.close()


def update_goods_info(good):
    """
    更新商品信息
    :param good:
    :return:
    """
    try:
        session = get_session()
        session.query(Goods).filter(Goods.good_id == good.good_id).update(good.getinfo())
        session.commit()
    except Exception:
        session.rollback()
        print("update good information fail!!!")
        raise
    finally:
        session.close()


def delete_goods(good_id):
    """
    删除商品
    :param good_id:
    :return:
    """
    try:
        session = get_session()
        session.query(Goods).filter(Goods.good_id == good_id).delete()
        session.commit()
    except Exception:
        session.rollback()
        print("delete goods fail!!!")
        raise
    finally:
        session.close()


"""
==================================================================
==========================Purchase_History Data Operation=====================
==================================================================
"""


def query_purchase_history(history_id=-1):
    """
    查询购买记录信息，history_id == -1, 返回所有购买记录
    :param history_id:
    :return:
    """
    session = get_session()
    histories = session.query(Purchase_history).all() if -1 == history_id \
        else session.query(Purchase_history).filter(
        Purchase_history.history_id == history_id).one()
    session.close()
    return histories


def query_purchase_history_orderby_purchase_date():
    """
    按购买日期返回所有购买记录
    :param:none
    :return:
    """
    session = get_session()
    histories = session.query(Purchase_history).order_by(Purchase_history.purchase_date.desc()).all()
    session.close()
    return histories


def add_purchase_history(user_id, good_id, count, total_price, purchase_date, category_id,
                         action_id=1):
    """
    添加购物记录
    :return:
    """
    purchase_history = Purchase_history(user_id=user_id, good_id=good_id, count=count,
                                        total_price=total_price, purchase_date=purchase_date,
                                        category_id=category_id, action_id=action_id)
    try:
        session = get_session()
        session.add(purchase_history)
        session.commit()
    except Exception:
        session.rollback()
        print("add purchase_history fail!!!")
        raise
    finally:
        session.close()


def update_purchase_history_info(purchase_history):
    """
    更新购买记录信息
    :param purchase_history:
    :return:
    """
    try:
        session = get_session()
        session.query(Purchase_history).filter(Purchase_history.history_id ==
                                               purchase_history.history_id).update(purchase_history.getinfo())
        session.commit()
    except Exception:
        session.rollback()
        print("update purchase history information fail!!!")
        raise
    finally:
        session.close()


def delete_purchase_history(history_id):
    """
    删除购买记录
    :param history_id:
    :return:
    """
    try:
        session = get_session()
        session.query(Purchase_history).filter(Purchase_history.history_id == history_id).delete()
        session.commit()
    except Exception:
        session.rollback()
        print("delete purchase history fail!!!")
        raise
    finally:
        session.close()


"""
==================================================================
==========================Goods category Data Operation=====================
==================================================================
"""


def query_goods_category(category_id=-1):
    """
    查询商品类型，category_id == -1, 返回所有商品类型
    :param category_id:
    :return:
    """
    session = get_session()
    histories = session.query(Goods_category).all() if -1 == category_id \
        else session.query(Goods_category).filter(
        Goods_category.category_id == category_id).one()
    session.close()
    return histories


def add_goods_category(category_id, category_name):
    """
    添加商品类型
    :param category_id:
    :param category_name:
    :return:
    """
    goods_category = Goods_category(category_id=category_id, category_name=category_name)
    try:
        session = get_session()
        session.add(goods_category)
        session.commit()
    except Exception:
        session.rollback()
        print("add goods_category fail!!!")
        raise
    finally:
        session.close()


def update_goods_category_info(goods_category):
    """
    更新商品类型信息
    :param goods_category:
    :return:
    """
    try:
        session = get_session()
        session.query(Purchase_history).filter(goods_category.history_id ==
                                               goods_category.history_id).update(goods_category.getinfo())
        session.commit()
    except Exception:
        session.rollback()
        print("update goods category information fail!!!")
        raise
    finally:
        session.close()


def delete_goods_category(category_id):
    """
    删除商品类型
    :param category_id:
    :return:
    """
    try:
        session = get_session()
        session.query(Goods_category).filter(Goods_category.history_id == category_id).delete()
        session.commit()
    except Exception:
        session.rollback()
        print("delete goods category fail!!!")
        raise
    finally:
        session.close()


"""
==================================================================
==========================Goods comment and Like info Data Operation=====================
==================================================================
"""


def add_goods_comment(user_id, good_id, content, time, name=None, gender=None):
    """
    输入user_id, good_id, content，向Goods comment表写入一行记录
    :param user_id:
    :param good_id:
    :param content:
    :param time:
    :param name:
    :return:
    """
    goods_comment = Goods_comment(user_id=user_id, good_id=good_id, content=content, time=time, name=name,
                                  gender=gender)
    try:
        session = get_session()
        session.add(goods_comment)
        session.commit()
    except Exception:
        session.rollback()
        print("add goods_comment fail!!!")
        raise
    finally:
        session.close()


def query_like_info(user_id=-1):
    """
    输入user_id,获取所有该用户喜欢的商品信息。user_id=-1,返回所有喜欢商品
    :param user_id:
    :return: 所有该用户喜欢的商品信息
    """
    session = get_session()
    likes = session.query(Like_info).all() if -1 == user_id \
        else session.query(Like_info).filter(
        Like_info.user_id == user_id).all()
    session.close()
    return likes


def delete_like(user_id, good_id):
    """
    输入user_id和good_id，删除like_info中指定的一行用户喜欢
    :param user_id:
    :param good_id:
    :return:
    """
    try:
        session = get_session()
        session.query(Like_info).filter(Like_info.user_id == user_id).filter(Like_info.good_id == good_id).delete()
        session.commit()
    except Exception:
        session.rollback()
        print("delete like info fail!!!")
        raise
    finally:
        session.close()


def add_goods_like(user_id, good_id):
    """
    输入user_id, good_id,向like_info表写入一行记录
    :param user_id:
    :param good_id:
    :return:
    """
    goods_like = Like_info(user_id=user_id, good_id=good_id)
    try:
        session = get_session()
        session.add(goods_like)
        session.commit()
    except Exception:
        session.rollback()
        print("add goods_like fail!!!")
        raise
    finally:
        session.close()


if __name__ == "__main__":
    pass
    # add_purchase_history(1, 2, 3, "4", "2019-8-8", "test")
    # h = [h for h in query_purchase_history() if h.other1 == "test"]
    # print(h[0].purchase_date)
