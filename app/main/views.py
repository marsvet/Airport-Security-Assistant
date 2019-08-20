from flask import render_template, request
from . import main


@main.route("/index")
@main.route("/")			# 路由映射
def index():
    return render_template("index.html", title="Home")
