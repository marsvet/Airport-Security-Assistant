from app import app
from flask import request
from flask import render_template  # 导入 render_template 函数，用于解析 html 模板
from .forms import LoginForm  # 从与该模块在同一目录下的 forms 模块导入 LoginForm 类
from flask import flash, redirect
from pymysql import connect
from werkzeug.security import generate_password_hash, check_password_hash
import json
import re
import random


db = connect(**{'host': '47.94.94.136', 'port': 3306,
                'user': 'root', 'password': '1358044937', 'db': 'aviation'})


# @app.route("/index")
# @app.route("/")			# 路由映射
# def index():
#     return render_template("index.html", title="Home")


@app.route('/login', methods=['POST'])
def login():
    value = request.form['user']
    if re.match(r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$', value):
        key = 'email'
        value = "'%s'" % value  # 在 value 两边加上引号
    elif re.match(r'^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7(?:[01356789]\d{2}|4(?:0\d|1[0-2]|9\d))|9[189]\d{2}|6[567]\d{2}|4[579]\d{2})\d{6}$', value):
        key = 'phone_number'
    else:
        return json.dumps({'isSuccess': False, 'msg': '请输入邮箱或手机号'}, ensure_ascii=False)
    cursor = db.cursor()
    if cursor.execute("select passwd from users where %s=%s" % (key, value)) != 1:
        cursor.close()
        return json.dumps({'isSuccess': False, 'msg': '您还未注册'}, ensure_ascii=False)
    password_hash = cursor.fetchone()[0]
    password = request.form['password']
    if not 6 <= len(password) <= 20:
        return json.dumps({'isSuccess': False, 'msg': '密码长度必须在 6 ~ 20 之间'}, ensure_ascii=False)
    if not re.match(r'^\w{6,20}$', password):
        return json.dumps({'isSuccess': False, 'msg': '密码必须由字母、数字、下划线组成'}, ensure_ascii=False)
    if check_password_hash(password_hash, password):
        cursor.close()
        return json.dumps({'isSuccess': True}, ensure_ascii=False)
    else:
        cursor.close()
        return json.dumps({'isSuccess': False, 'msg': '密码错误'}, ensure_ascii=False)


@app.route('/register', methods=['POST'])
def register():
    try:
        email = re.match(
            r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$', request.form['email']).group()
    except:
        return json.dumps({'isSuccess': False, 'msg': '电子邮件格式不正确'}, ensure_ascii=False)
    cursor = db.cursor()
    if cursor.execute("select * from users where email='%s'" % email) > 0:
        cursor.close()
        return json.dumps({'isSuccess': False, 'msg': '该邮箱已被注册'}, ensure_ascii=False)
    password = request.form['password']
    if not 6 <= len(password) <= 20:
        return json.dumps({'isSuccess': False, 'msg': '密码长度必须在 6 ~ 20 之间'}, ensure_ascii=False)
    if not re.match(r'^\w{6,20}$', password):
        return json.dumps({'isSuccess': False, 'msg': '密码必须由字母、数字、下划线组成'}, ensure_ascii=False)
    password_hash = generate_password_hash(password)
    if cursor.execute("insert into users values(null, '无昵称', '%s', null, '%s')" % (password_hash, email)) != 1:
        cursor.close()
        return json.dumps({'isSuccess': False, 'msg': '系统内部错误'}, ensure_ascii=False)
    cursor.close()
    db.commit()
    return json.dumps({'isSuccess': True}, ensure_ascii=False)
