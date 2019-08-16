from app import app
from flask import request
from flask import render_template  # 导入 render_template 函数，用于解析 html 模板
from .forms import LoginForm  # 从与该模块在同一目录下的 forms 模块导入 LoginForm 类
from flask import flash, redirect
from pymysql import connect
from werkzeug.security import generate_password_hash, check_password_hash
import json


db = connect(**{'host': '47.94.94.136', 'port': 3306,
              'user': 'root', 'password': '1358044937', 'db': 'aviation'})


# @app.route("/index")
# @app.route("/")			# 路由映射
# def index():
#     return render_template("index.html", title="Home")


@app.route('/login', methods=['POST'])
def login():
    cursor = db.cursor()
    username = request.args['username']
    if cursor.execute("select passwd from users where user_name='%s'" % username) != 1:
        cursor.close()
        return json.dumps({'isSuccess': False, 'msg': '用户不存在'}, ensure_ascii=False)
    password = request.args['password']
    db_password = cursor.fetchone()[0]
    if check_password_hash(db_password, password):
        cursor.close()
        return json.dumps({'isSuccess': True}, ensure_ascii=False)
    else:
        cursor.close()
        return json.dumps({'isSuccess': False, 'msg': '密码错误'}, ensure_ascii=False)



@app.route('/register', methods=['POST'])
def register():
    cursor = db.cursor()
    username = request.args['username']
    if cursor.execute("select * from users where user_name='%s'" % username) > 0:
        cursor.close()
        return json.dumps({'isSuccess': False, 'msg': '用户名已存在'}, ensure_ascii=False)
    password = generate_password_hash(request.args['password'])
    if cursor.execute("insert into users values(null, '%s', '%s', null, null)" % (username, password)) != 1:
        cursor.close()
        return json.dumps({'isSuccess': False, 'msg': '系统内部错误'}, ensure_ascii=False)
    cursor.close()
    db.commit()
    return json.dumps({'isSuccess': True}, ensure_ascii=False)
