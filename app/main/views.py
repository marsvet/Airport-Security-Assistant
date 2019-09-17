from flask import render_template, request, jsonify
from flask_login import login_required
from . import main
from ..models import Res, City_code
import requests as req


@main.route("/index")
@main.route("/")  # 路由映射
@login_required
def index():
    return render_template("index.html", title="首页")


@main.route("/res_info")
def get_res_info():
    res_name = request.json['res_name']
    res = Res()
    if res.get_res_info_by_resname(res_name):
        to_return = {'isSuccess': True, '物品名称': res.res_name, '附加说明': res.description,
                     '限定规格': res.limit, '携带方式': res.carry_method, '物品所属分类': res.res_class}
        return jsonify(to_return)
    else:
        return jsonify({'isSuccess': True, '携带方式': '可以随身携带'})


@main.route("/all_location")
def get_all_location():
    city_code = City_code()
    return jsonify(city_code.get_all_city())

@main.route("/flight_info_with_location", methods=["POST"])
def get_flight_info_with_location():
    city_code = City_code()

    leave = request.json['leave']
    arrive = request.json['arrive']
    date = request.json['date']

    headers = {"Authorization": "APPCODE 797a45df4c3e4876ad887686d674010f"}
    data = {
        "arrive_code": city_code.get_code_with_city(arrive),
        "leave_code": city_code.get_code_with_city(leave),
        "query_date": date
    }

    rsp = req.post("http://airinfo.market.alicloudapi.com/airInfos",
                   data=data, headers=headers)
    rsp.encoding = rsp.apparent_encoding
    flightInfos = rsp.text

    return jsonify(flightInfos)
