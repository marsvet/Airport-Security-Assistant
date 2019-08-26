from flask import render_template, flash, redirect, request, url_for, jsonify
from flask_login import login_user
from . import auth
from .forms import LoginForm, RegisterForm
from ..models import User
import re
import random


# prepare for Andriod APP
@auth.route('/login', methods=['POST'])  # 用电话号码或邮箱登录，不能用用户名登录，因为用户名不唯一
def login():
    data = request.get_json()
    email_or_phone = data['user']    # 获取电话号码或邮箱
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
        return jsonify({'isSuccess': True})


# prepare for Andriod APP
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
    return jsonify({'isSuccess': True})


# prepare for web
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
    return render_template('login.html', form=form)


@auth.route('/_register', methods=['GET', 'POST'])
def _register():
    form = RegisterForm()
    if form.validate_on_submit():
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
    return render_template('register.html', form=form)
