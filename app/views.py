from app import app
from flask import request
from flask import render_template	# 导入 render_template 函数，用于解析 html 模板
from .forms import LoginForm	# 从与该模块在同一目录下的 forms 模块导入 LoginForm 类
from flask import flash, redirect


@app.route("/index")
@app.route("/")			# 路由映射
def index():
    return render_template("index.html", title="Home")


@app.route("/about")
def about():
    return render_template("about.html", title="About")


@app.route("/contact")
def contact():
    return render_template("contact.html", title="Contact")


@app.route("/portfolio")
def portfolio():
    return render_template("portfolio.html", title="Portfolio")


@app.route("/services")
def services():
    return render_template("services.html", title="Services")
