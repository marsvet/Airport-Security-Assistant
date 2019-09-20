from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
from . import db, login_manager


class User(UserMixin):
    def __init__(self):
        db.ping(reconnect=True)
        self.cursor = db.cursor()
        self.__set_attr(0)

    def __del__(self):
        self.cursor.close()

    def __set_attr(self, count):
        if count:
            self.id, self.username, self.password_hash, self.phone_number, self.email, self.signature, self.user_from = self.cursor.fetchone()
        else:
            self.id, self.username, self.password_hash, self.phone_number, self.email, self.signature, self.user_from = (
                None,) * 7

    def get_user(self, key, value):
        if key in ['user_id', 'phone_number']:
            sql = "select * from users where %s = %s" % (key, value)
        else:
            sql = "select * from users where %s = '%s'" % (key, value)
        count = self.cursor.execute(sql)
        self.__set_attr(count)
        return count

    def add_user(self, email, password, phone_number="null", username="无昵称", signature="null", user_from="null"):
        password_hash = generate_password_hash(password)
        sql = "insert into users values(null, '%s', '%s', %s, '%s', '%s', '%s')" % (username,
                                                                                    password_hash, phone_number, email, signature, user_from)
        count = self.cursor.execute(sql)
        self.__set_attr(0)
        db.commit()
        return count

    def modify_user(self, password=None, phone_number=None, username=None, signature=None, user_from=None):
        sql = "update users set user_id = %s" % self.id
        if password is not None:
            password_hash = generate_password_hash(password)
            sql += ", passwd = '%s'" % password_hash
        if phone_number is not None:
            sql += ", phone_number = %s" % phone_number
        if username is not None:
            sql += ", user_name = '%s'" % username
        if signature is not None:
            sql += ", signature = '%s'" % signature
        if user_from is not None:
            sql += ", user_from = '%s'" % user_from
        sql += " where user_id = %s" % self.id

        count = self.cursor.execute(sql)
        db.commit()

        return count

    def verify_password(self, password):
        return check_password_hash(self.password_hash, password)


@login_manager.user_loader
def load_user(user_id):
    user = User()
    user.get_user("user_id", user_id)
    return user


class Res():
    def __init__(self):
        db.ping(reconnect=True)
        self.cursor = db.cursor()

    def __del__(self):
        self.cursor.close()

    def __set_attr(self, count):
        if count:
            self.res_name, self.description, self.limit, self.carry_method, self.res_class = self.cursor.fetchone()
        else:
            self.res_name, self.description, self.limit, self.carry_method, self.res_class = (
                None,) * 5

    def get_res_info_by_resname(self, name):
        sql = "select * from 物品信息 where 物品名称 = '%s'" % name
        count = self.cursor.execute(sql)
        self.__set_attr(count)
        return count


class City_code():
    def __init__(self):
        db.ping(reconnect=True)
        self.cursor = db.cursor()

    def __del__(self):
        self.cursor.close()

    def get_code_with_city(self, city):
        sql = "select code from city_code where city='%s'" % city
        self.cursor.execute(sql)
        return self.cursor.fetchone()[0]

    def get_city_with_code(self, code):
        sql = "select city from city_code where code='%s'" % code
        self.cursor.execute(sql)
        return self.cursor.fetchone()[0]

    def get_all_city(self):
        sql = "select city from city_code"
        self.cursor.execute(sql)
        cities = [array[0] for array in self.cursor.fetchall()]
        return cities
