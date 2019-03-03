from sqlalchemy import Column, String, create_engine, Integer
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from config import mysql_config

# 创建对象的基类:
Base = declarative_base()


class User(Base):
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
    __tablename__ = 'goods_info'
    good_id = Column(Integer, primary_key=True)
    name = Column(String(255), unique=True)
    price = Column(String(255))
    other1 = Column(String(255))
    other2 = Column(String(255))

    def getinfo(self):
        """

        :return:
        """
        goods_info = {
            'name': self.name,
            'price': self.price,
            'other1': self.other1,
            'other2': self.other2
        }
        return goods_info

    def __repr__(self):
        return "<goods_info: {}>".format(self.name)


class Purchase_history(Base):
    __tablename__ = 'purchase_history'
    history_id = Column(Integer, primary_key=True)
    user_id = Column(Integer)
    good_id = Column(Integer)
    count = Column(Integer)
    total_price = Column(String(255))
    purchase_date = Column(String(255))
    other1 = Column(String(255))
    other2 = Column(String(255))

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
            'other1': self.other1,
            'other2': self.other2
        }
        return purchase_history_info

    def __repr__(self):
        return "<purchase_history: {}>".format(self.purchase_date)


def get_session():
    """
    建立连接，获取数据库会话
    :return: session会话
    """
    SQLALCHEMY_DATABASE_URI = \
    mysql_config['Database'] + '+' + mysql_config['dataconnector'] + '://' +\
    mysql_config['admin'] + ':' + mysql_config['password'] + '@' +\
    mysql_config['ip'] + ':' + mysql_config['port'] + '/' +\
    mysql_config['database'] + '?charset=' + mysql_config['charset']

    engine = create_engine(SQLALCHEMY_DATABASE_URI)
    DBSession = sessionmaker(bind=engine)
    return DBSession()


if __name__ == "__main__":
    session = get_session()
    user = session.query(User).filter(User.user_id == '2').one()
    print(user.name)
