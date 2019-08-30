from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, SubmitField, ValidationError
from wtforms.validators import DataRequired, Length, Regexp, EqualTo
from ..models import User
import re


class LoginForm(FlaskForm):
    account = StringField('邮箱 / 电话', validators=[DataRequired('请输入邮箱或手机号码'), Regexp(
        r'(^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$)|(^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7(?:[01356789]\d{2}|4(?:0\d|1[0-2]|9\d))|9[189]\d{2}|6[567]\d{2}|4[579]\d{2})\d{6}$)', 0, '邮箱或手机号码格式不正确')])
    password = PasswordField('密码', validators=[DataRequired(
        '请输入密码'), Length(6, 20, '密码长度必须在 6 ~ 20 之间'), Regexp(r'^\w{6,20}$', 0, '密码必须由字母、数字、下划线组成')])
    remember_me = BooleanField('下次记住我')
    submit = SubmitField('登录')


class RegisterForm(FlaskForm):
    email = StringField('邮箱', validators=[DataRequired('请输入邮箱'), Regexp(
        r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$', 0, '邮箱格式不正确')])
    verification_code = StringField('验证码', validators=[DataRequired('请输入验证码')])
    hidden_verification_code_hash = StringField()
    password = PasswordField('密码', validators=[DataRequired('请输入密码'), Length(
        6, 20, '密码长度必须在 6 ~ 20 之间'), Regexp(r'^\w{6,20}$', 0, '密码必须由字母、数字、下划线组成')])
    check_password = PasswordField(
        '再次输入密码', validators=[EqualTo('password', '两次输入的密码不一致')])
    phone_number = StringField('电话号码')
    nickname = StringField('昵称')
    submit = SubmitField('注册')

    def validate_phone_number(self, field):
        phone_number = field.data
        if phone_number and not re.match(r'^(?:\+?86)?1(?:3\d{3}|5[^4\D]\d{2}|8\d{3}|7(?:[01356789]\d{2}|4(?:0\d|1[0-2]|9\d))|9[189]\d{2}|6[567]\d{2}|4[579]\d{2})\d{6}$', phone_number):
            raise ValidationError('电话号码格式不正确')
