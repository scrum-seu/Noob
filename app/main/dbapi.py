from app.models.models import get_session, User, Goods, Purchase_history


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


def add_goods(name, price, other1=None, other2=None):
    """
    添加商品
    :return:
    """
    good = Goods(name=name, price=price, other1=other1, other2=other2)
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


def add_purchase_history(user_id, good_id, count, total_price, purchase_date, other1=None,
                         other2=None):
    """
    添加购物记录
    :return:
    """
    purchase_history = Purchase_history(user_id=user_id, good_id=good_id, count=count,
                                        total_price=total_price, purchase_date=purchase_date,
                                        other1=other1, other2=other2)
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


if __name__ == "__main__":
    # add_purchase_history(1, 2, 3, "4", "2019-8-8", "test")
    # h = [h for h in query_purchase_history() if h.other1 == "test"]
    print(h[0].purchase_date)
