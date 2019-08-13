from flask_wtf import Form 			# 在 Flask-WTF 中，表单是表示成对象，Form 类的子类。一个表单子类简单地把表单的域定义成类的变量。
from wtforms import StringField, PasswordField, BooleanField	# 导入需要的字段类
from wtforms.validators import DataRequired		# 导入验证器。DataRequired 验证器只是简单的验证是否为空

class LoginForm(Form):	# 登录表单。继承 Form 类
	username = StringField("username", validators=[DataRequired()])
	password = PasswordField("password", validators=[DataRequired()])
	remember_me = BooleanField("remember_me", default=False)	# 默认值为不选
