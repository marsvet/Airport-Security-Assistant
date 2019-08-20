from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
from . import db, login_manager


class User(UserMixin):
    def __init__(self):
        self.cursor = db.cursor()
        self.__set_attr(0)

    def __del__(self):
        self.cursor.close()

    def __set_attr(self, count):
        if count:
            self.user_id, self.username, self.password_hash, self.phone_number, self.email = self.cursor.fetchone()
        else:
            self.user_id, self.username, self.password_hash, self.phone_number, self.email = (
                None,) * 5

    def get_user(self, key, value):
        if key in ['user_id', 'phone_number']:
            sql = "select * from users where %s = %s" % (key, value)
        else:
            sql = "select * from users where %s = '%s'" % (key, value)
        count = self.cursor.execute(sql)
        self.__set_attr(count)
        return count

    def add_user(self, email, password):
        password_hash = generate_password_hash(password)
        sql = "insert into users values(null, '无昵称', '%s', null, '%s')" % (
            password_hash, email)
        count = self.cursor.execute(sql)
        self.__set_attr(0)
        db.commit()
        return count

    def verify_password(self, password):
        return check_password_hash(self.password_hash, password)


@login_manager.user_loader
def load_user(user_id):
    user = User()
    user.get_user("user_id", user_id)
    return user
