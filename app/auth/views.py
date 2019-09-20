from flask import render_template, flash, redirect, request, url_for, jsonify
from flask_login import login_user, logout_user
from werkzeug.security import generate_password_hash, check_password_hash
from . import auth
from .forms import LoginForm, RegisterForm
from ..models import User
from ..email import send_email
import re
import random


######## prepare for Andriod APP ########

@auth.route('/verify_email', methods=['POST'])
def verify_email():
    try:
        email = re.match(
            r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$', request.get_json()['email']).group()
    except:
        return jsonify({'isSuccess': False, 'msg': '电子邮件格式不正确'})
    verification_code = random.randint(100000, 999999)
    send_email(email, '验证邮箱', 'mail/verify_email',
               verification_code=verification_code)
    return jsonify({'verification_code': verification_code})


@auth.route('/login', methods=['POST'])  # 用电话号码或邮箱登录，不能用用户名登录，因为用户名不唯一
def login():
    data = request.get_json()
    email_or_phone = str(data['user'])    # 获取电话号码或邮箱
    password = data['password']
    if re.match(r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$', email_or_phone):   # 判断是否为邮箱
        key = 'email'
    elif re.match(r'^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7(?:[01356789]\d{2}|4(?:0\d|1[0-2]|9\d))|9[189]\d{2}|6[567]\d{2}|4[579]\d{2})\d{6}$', email_or_phone):  # 判断是否为电话号码
        key = 'phone_number'
    else:
        return jsonify({'isSuccess': False, 'msg': '请输入邮箱或手机号码'})
    user = User()
    if not user.get_user(key, email_or_phone):
        return jsonify({'isSuccess': False, 'msg': '您还未注册'})
    if not 6 <= len(password) <= 20:
        return jsonify({'isSuccess': False, 'msg': '密码长度必须在 6 ~ 20 之间'})
    if not re.match(r'^\w{6,20}$', password):
        return jsonify({'isSuccess': False, 'msg': '密码必须由字母、数字、下划线组成'})
    if not user.verify_password(password):
        return jsonify({'isSuccess': False, 'msg': '密码错误'})
    else:
        return jsonify({"isSuccess": True})


@auth.route('/register', methods=['POST'])   # 用邮箱注册
def register():
    data = request.get_json()
    try:
        email = re.match(
            r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$', data['email']).group()
    except:
        return jsonify({'isSuccess': False, 'msg': '电子邮件格式不正确'})
    user = User()
    if user.get_user("email", email) > 0:
        return jsonify({'isSuccess': False, 'msg': '该邮箱已被注册'})
    password = data['password']
    if not 6 <= len(password) <= 20:
        return jsonify({'isSuccess': False, 'msg': '密码长度必须在 6 ~ 20 之间'})
    if not re.match(r'^\w{6,20}$', password):
        return jsonify({'isSuccess': False, 'msg': '密码必须由字母、数字、下划线组成'})
    if user.add_user(email, password) != 1:
        return jsonify({'isSuccess': False, 'msg': '系统内部错误'})
    return jsonify({"isSuccess": True})


@auth.route('/user_info')
def get_user_info():
    email = request.json['email']
    user = User()
    if user.get_user("email", email) == 0:
        return jsonify({"isSuccess": False, "msg": "该邮箱不存在"})
    user_info = {
        "username": user.username,
        "email": user.email,
        "signature": user.signature,
        "user_from": user.user_from
    }
    if user.phone_number is not None:
        user_info["phone_number"] = str(user.phone_number)
    else:
        user_info["phone_number"] = user.phone_number

    return jsonify(user_info)


@auth.route("/verify_password", methods=['POST'])
def verify_password():
    email = request.json["email"]
    password = request.json["password"]
    user = User()
    if user.get_user("email", email) == 0:
        return jsonify({"isSuccess": False, "msg": "该邮箱不存在"})
    if user.verify_password(password):
        return jsonify({"isSuccess": True})
    else:
        return jsonify({"isSuccess": False})


@auth.route("/modify_user_info", methods=['POST'])
def modify_user_info():
    email = request.json["email"]
    new_info = {
        "new_username": None,
        "new_password": None,
        "new_phone_number": None,
        "new_signature": None,
        "new_user_from": None
    }
    for key in new_info.keys():
        if key in request.json.keys():
            new_info[key] = request.json[key]

    user = User()
    if user.get_user("email", email) == 0:
        return jsonify({"isSuccess": False, "msg": "该邮箱不存在"})
    user.modify_user(password=new_info["new_password"], phone_number=new_info["new_phone_number"],
                     username=new_info["new_username"], signature=new_info["new_signature"], user_from=new_info["new_user_from"])

    return jsonify({"isSuccess": True})
######## prepare for Andriod APP ########


######## prepare for Web ########
@auth.route('/_verify_email', methods=['POST'])
def _verify_email():
    email = request.form['email']
    verification_code = random.randint(100000, 999999)
    send_email(email, '验证邮箱', 'mail/verify_email',
               verification_code=verification_code)
    return generate_password_hash(str(verification_code))


@auth.route('/_login', methods=['GET', 'POST'])
def _login():
    form = LoginForm()
    if form.validate_on_submit():
        user = User()
        try:
            assert user.get_user("email", form.account.data)
        except:
            try:
                assert user.get_user("phone_number", form.account.data)
            except:
                flash('您还未注册')
                return redirect('/_login')
        if not user.verify_password(form.password.data):
            flash('密码错误')
            return redirect('/_login')
        login_user(user, form.remember_me.data)
        next = request.args.get('next')
        if next is None or not next.startswith('/'):
            next = url_for('main.index')
        return redirect(next)
    return render_template('login.html', form=form, title="用户登录")


@auth.route('/_register', methods=['GET', 'POST'])
def _register():
    form = RegisterForm()
    if form.validate_on_submit():
        if not check_password_hash(form.hidden_verification_code_hash.data, form.verification_code.data):
            flash('验证码错误')
            return redirect('_register')
        phone_number = form.phone_number.data
        nickname = form.nickname.data
        if not phone_number:
            phone_number = "null"
        if not nickname:
            nickname = "无昵称"
        user = User()
        user.add_user(form.email.data, form.password.data,
                      phone_number, nickname)
        flash('注册成功，请登录')
        return redirect('/_login')
    return render_template('register.html', form=form, title="新用户注册")


@auth.route('/_logout')
def _logout():
    logout_user()
    flash('账号已退出')
    return redirect(url_for('auth._login'))

######## prepare for Web ########
