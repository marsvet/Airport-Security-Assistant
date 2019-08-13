from flask import Flask		# 导入 Flask 类

app = Flask(__name__)		# 创建 app 对象
app.config.from_object("config")	# 指定要读取的配置文件的文件名

from app import views		# 导入 views 模块
