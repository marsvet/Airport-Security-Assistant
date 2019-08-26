from flask import render_template, request
from flask_login import login_required
from . import main


@main.route("/index")
@main.route("/")  # 路由映射
@login_required
def index():
    return render_template("index.html", title="Home")
