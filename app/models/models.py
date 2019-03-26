from sqlalchemy import Column, String, create_engine, Integer, Text
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from config import mysql_config


# 创建对象的基类:
Base = declarative_base()


class User(Base):
    """
    User map the user table in mysql

    """
    __tablename__ = 'user_info'
    user_id = Column(Integer, primary_key=True)
    biomarker = Column(String(255), unique=True)
    name = Column(String(255))
    sex = Column(String(255))
    age = Column(String(255))
    occupation = Column(String(255))
    phone_num = Column(String(255))
    other1 = Column(String(255))
    other2 = Column(String(255))
    other3 = Column(String(255))

    def getinfo(self):
        """
        字典化用户数据
        :return:
        """
        user_info = {
            'biomarker': self.biomarker,
            'name': self.name,
            'sex': self.sex,
            'age': self.age,
            'occupation': self.occupation,
            'phone_num': self.phone_num,
            'other1': self.other1,
            'other2': self.other2,
            'other3': self.other3
        }
        return user_info

    def __repr__(self):
        return "<User: {}>".format(self.name)


class Goods(Base):
    """
    Goods map the goods table in mysql database
    """
    __tablename__ = 'goods_info'
    good_id = Column(Integer, primary_key=True)
    name = Column(String(255), unique=True)
    price = Column(String(255))
    category = Column(String(255))
    other2 = Column(String(255))

    def getinfo(self):
        """

        :return:
        """
        goods_info = {
            'good_id': self.good_id,
            'name': self.name,
            'price': self.price,
            'category': self.category,
            'other2': self.other2
        }
        return goods_info

    def __repr__(self):
        return "<goods_info: {}>".format(self.name)


class Purchase_history(Base):
    """
    Purchase_history map the Purchase_history in mysql database
    """
    __tablename__ = 'purchase_history'
    history_id = Column(Integer, primary_key=True)
    user_id = Column(Integer)
    good_id = Column(Integer)
    count = Column(Integer)
    total_price = Column(String(255))
    purchase_date = Column(String(255))
    category_id = Column(Integer)
    action_id = Column(Integer)

    # goods = db.relationship('Goods', backref='purchase_record')
    # user = db.relationship('User', backref='user')

    def getinfo(self):
        """

        :return:
        """
        purchase_history_info = {
            'user_id': self.user_id,
            'good_id': self.good_id,
            'count': self.count,
            'total_price': self.total_price,
            'purchase_date': self.purchase_date,
            'category_id': self.category_id,
            'action_id': self.action_id
        }
        return purchase_history_info

    def __repr__(self):
        return "<purchase_history: {}>".format(self.purchase_date)


class Goods_category(Base):
    """
    Goods_category map the Goods_category in mysql database
    """
    __tablename__ = 'goods_category'
    category_id = Column(Integer, primary_key=True)
    category_name = Column(String(255))

    def getinfo(self):
        """

        :return:
        """
        goods_category_info = {
            'category_id': self.category_id,
            'category_name': self.category_name,
        }
        return goods_category_info

    def __repr__(self):
        return "<goods_category_info: {}>".format(self.category_name)


class Goods_comment(Base):
    """
    Goods_comment map the goods_comment in mysql database
    """
    __tablename__ = 'goods_comment'
    comment_id = Column(Integer, primary_key=True)
    good_id = Column(Integer)
    user_id = Column(Integer)
    content = Column(Text)
    gender = Column(Integer)
    time = Column(String)
    name = Column(String)

    def getinfo(self):
        """

        :return:
        """
        goods_comment_info = {
            'comment_id': self.comment_id,
            'good_id': self.good_id,
            'user_id': self.user_id,
            'content': self.content,
            'gender': self.gender,
            'time': self.time,
            'name': self.name,
        }
        return goods_comment_info

    def __repr__(self):
        return "<goods_comment_info: {}>".format(self.comment_id)


class Like_info(Base):
    """
    Like_info map the like_info in mysql database
    """
    __tablename__ = 'like_info'
    like_id = Column(Integer, primary_key=True)
    user_id = Column(Integer)
    good_id = Column(Integer)

    def getinfo(self):
        """

        :return:
        """
        goods_like_info = {
            'like_id': self.like_id,
            'user_id': self.user_id,
            'good_id': self.good_id,
        }
        return goods_like_info

    def __repr__(self):
        return "<goods_like_info: {}>".format(self.like_id)


def get_session():
    """
    建立连接，获取数据库会话
    :return: session会话
    """
    SQLALCHEMY_DATABASE_URI = \
        mysql_config['Database'] + '+' + mysql_config['dataconnector'] + '://' + \
        mysql_config['admin'] + ':' + mysql_config['password'] + '@' + \
        mysql_config['ip'] + ':' + mysql_config['port'] + '/' + \
        mysql_config['database'] + '?charset=' + mysql_config['charset']

    engine = create_engine(SQLALCHEMY_DATABASE_URI)
    DBSession = sessionmaker(bind=engine)
    return DBSession()


if __name__ == "__main__":
    session = get_session()
    goods_category = session.query(Goods_category).one()
    print(goods_category.category_name)
