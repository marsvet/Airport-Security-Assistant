# -*-coding:utf-8-*-
#
# 用户相关 api
#
from flask import request, jsonify, g
from werkzeug.security import generate_password_hash, check_password_hash
# from app import token_auth
from app.api import api
from app.models import User
from app.email import send_email
# from app.token import generate_auth_token, get_auth_token_data
import re
import random


###############
# for web app #
###############
# @token_auth.verify_token
# def verify_token(token):
#     if not token:
#         return False
#     data = get_auth_token_data(token)
#     if data is None:
#         return False
#     g.auth_data = data
#     return True


# @api.route('/_verify_email')
# def _verify_email():
#     try:
#         email = re.match(
#             r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$', request.args['email']).group()
#     except:
#         return jsonify({'isSuccess': False, 'msg': '电子邮件格式不正确'})
#     verification_code = str(random.randint(100000, 999999))
#     send_email(email, '验证邮箱', 'mail/verify_email',
#                verification_code=verification_code)
#     token = generate_auth_token({'verification_code': verification_code}, 600)
#     return jsonify({'isSuccess': True, 'token': token})


# @api.route('/_register', methods=['POST'])
# @token_auth.login_required
# def _register():
#     data = request.get_json()
#     try:
#         email = re.match(
#             r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$', data['email']).group()
#     except:
#         return jsonify({'isSuccess': False, 'msg': '电子邮件格式不正确'})

#     print(g.auth_data['verification_code'])
#     print(data['verification_code'])

#     if g.auth_data['verification_code'] != data['verification_code']:
#         return jsonify({'isSuccess': False, 'msg': '验证码错误'})

#     user = User()
#     if user.get_user("email", email) > 0:
#         return jsonify({'isSuccess': False, 'msg': '该邮箱已被注册'})
#     password = data['password']
#     if not 6 <= len(password) <= 20:
#         return jsonify({'isSuccess': False, 'msg': '密码长度必须在 6 ~ 20 之间'})
#     if not re.match(r'^\w{6,20}$', password):
#         return jsonify({'isSuccess': False, 'msg': '密码必须由字母、数字、下划线组成'})
#     if user.add_user(email, password) != 1:
#         return jsonify({'isSuccess': False, 'msg': '系统内部错误'})
#     return jsonify({"isSuccess": True})


# @api.route('/_login', methods=['POST'])  # 用电话号码或邮箱登录，不能用用户名登录，因为用户名不唯一
# def _login():
#     data = request.get_json()
#     email_or_phone = str(data['user'])    # 获取电话号码或邮箱
#     password = data['password']
#     if re.match(r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$', email_or_phone):   # 判断是否为邮箱
#         key = 'email'
#     elif re.match(r'^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7(?:[01356789]\d{2}|4(?:0\d|1[0-2]|9\d))|9[189]\d{2}|6[567]\d{2}|4[579]\d{2})\d{6}$', email_or_phone):  # 判断是否为电话号码
#         key = 'phone_number'
#     else:
#         return jsonify({'isSuccess': False, 'msg': '请输入邮箱或手机号码'})
#     user = User()
#     if not user.get_user(key, email_or_phone):
#         return jsonify({'isSuccess': False, 'msg': '您还未注册'})
#     if not 6 <= len(password) <= 20:
#         return jsonify({'isSuccess': False, 'msg': '密码长度必须在 6 ~ 20 之间'})
#     if not re.match(r'^\w{6,20}$', password):
#         return jsonify({'isSuccess': False, 'msg': '密码必须由字母、数字、下划线组成'})
#     if not user.verify_password(password):
#         return jsonify({'isSuccess': False, 'msg': '密码错误'})
#     else:
#         token = generate_auth_token({'id': user.id})
#         return jsonify({"isSuccess": True, 'token': token})


# @api.route('/_user_info')
# @token_auth.login_required
# def _get_user_info():
#     user_id = g.auth_data['id']
#     user = User()
#     user.get_user("user_id", user_id)
#     user_info = {
#         "isSuccess": True,
#         "username": user.username,
#         "email": user.email,
#         "signature": user.signature,
#         "user_from": user.user_from
#     }
#     if user.phone_number is not None:
#         user_info["phone_number"] = str(user.phone_number)
#     else:
#         user_info["phone_number"] = user.phone_number

#     new_token = generate_auth_token({'id': user.id})
#     user_info['token'] = new_token

#     return jsonify(user_info)


# @api.route("/_modify_user_info", methods=['POST'])
# @token_auth.login_required
# def _modify_user_info():
#     user_id = g.auth_data['id']
#     new_info = {
#         "new_username": None,
#         "new_password": None,
#         "new_phone_number": None,
#         "new_signature": None,
#         "new_user_from": None
#     }
#     for key in new_info.keys():
#         if key in request.json.keys():
#             new_info[key] = request.json[key]

#     user = User()
#     user.get_user('user_id', user_id)
#     user.modify_user(password=new_info["new_password"], phone_number=new_info["new_phone_number"],
#                      username=new_info["new_username"], signature=new_info["new_signature"], user_from=new_info["new_user_from"])

#     new_token = generate_auth_token({'id': user.id})

#     return jsonify({"isSuccess": True, 'token': new_token})


###################
# for android app #
###################
@api.route('/verify_email', methods=['POST'])
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


@api.route('/login', methods=['POST'])  # 用电话号码或邮箱登录，不能用用户名登录，因为用户名不唯一
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


@api.route('/register', methods=['POST'])   # 用邮箱注册
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


@api.route('/user_info', methods=["POST"])
def get_user_info():
    email = request.json['email']
    user = User()
    if user.get_user("email", email) == 0:
        return jsonify({"isSuccess": False, "msg": "该邮箱不存在"})
    user_info = {
        "isSuccess": True,
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


@api.route("/verify_password", methods=['POST'])
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


@api.route("/modify_user_info", methods=['POST'])
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
