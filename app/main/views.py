from flask import render_template, request, jsonify
from flask_login import login_required
from . import main
from ..models import Res
import requests as req
import json


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
    with open("app/static/data/location_code_mapping.json", 'r') as f:
        mapping = json.loads(f.read())
    return jsonify(list(mapping.keys()))

@main.route("/flight_info_with_location", methods=["POST"])
def get_flight_info_with_location():
    with open("app/static/data/location_code_mapping.json", 'r') as f:
        mapping = json.loads(f.read())

    leave = request.json['leave']
    arrive = request.json['arrive']
    date = request.json['date']

    headers = {"Authorization": "APPCODE 797a45df4c3e4876ad887686d674010f"}
    data = {
        "arrive_code": mapping[arrive],
        "leave_code": mapping[leave],
        "query_date": date
    }

    rsp = req.post("http://airinfo.market.alicloudapi.com/airInfos",
                   data=data, headers=headers)
    rsp.encoding = rsp.apparent_encoding
    flightInfos = rsp.text

    return jsonify(flightInfos)
