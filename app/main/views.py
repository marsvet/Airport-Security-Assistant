from flask import render_template, request, jsonify
from flask_login import login_required
from lxml import etree
from . import main
from .. import config
from ..models import Res, City_code
import requests as req
from base64 import b64encode
import json
import re
import os


@main.route("/index")
@main.route("/")  # 路由映射
@login_required
def index():
    return render_template("index.html", title="首页")


@main.route("/all_res_name")
def get_all_res_name():
    res = Res()
    return jsonify(res.get_all_res_name())


@main.route("/res_info", methods=["POST"])
def get_res_info():
    res_name = request.json['res_name']
    res = Res()
    if res.get_res_info_by_resname(res_name):
        exist_images = os.listdir("app/static/res")
        to_return = {
            'isSuccess': True,
            '物品名称': res.res_name,
            '附加说明': res.description,
            '限定规格': res.limit,
            '携带方式': res.carry_method,
            '物品所属分类': res.res_class,
            '图片地址': "/static/res/%s.jpeg" % res_name if res_name + ".jpeg" in exist_images else None
        }
        return jsonify(to_return)
    else:
        return jsonify({'isSuccess': True, '携带方式': '可以随身携带'})


@main.route("/res_info_by_image", methods=["POST"])
def get_res_info_by_image():
    ALLOWED_EXTENSIONS = ["jpg", "jpeg", "png", "gif", "bmp"]
    URL = "https://aip.baidubce.com/rest/2.0/image-classify/v2/advanced_general"

    image = request.files["image"]
    if image.filename.split('.')[-1].lower() not in ALLOWED_EXTENSIONS:
        return jsonify({"isSuccess": False, "msg": "文件格式不支持"})

    rsp = req.post(URL + '?access_token=' + config.BAIDU_AI_ACCESS_TOKEN, data={
        "image": b64encode(image.read())
    })
    try:
        result = json.loads(rsp.content)["result"]
    except:
        return jsonify({"isSuccess": False, "msg": "找不到图片，请检查图片地址"})
    result.sort(key=lambda item: item["score"], reverse=True)

    res = Res()
    for item in result:
        obs = re.split(r"[/-]", item["keyword"])
        for ob in obs:
            if res.get_res_info_by_resname(ob):
                exist_images = os.listdir("app/static/res")
                to_return = {
                    'isSuccess': True,
                    '物品名称': res.res_name,
                    '附加说明': res.description,
                    '限定规格': res.limit,
                    '携带方式': res.carry_method,
                    '物品所属分类': res.res_class,
                    '图片地址': "/static/res/%s.jpeg" % ob if ob + ".jpeg" in exist_images else None
                }
                return jsonify(to_return)
    return jsonify({"isSuccess": False, "msg": "找不到此物品"})


@main.route("/all_location")
def get_all_location():
    city_code = City_code()
    return jsonify(city_code.get_all_city())


@main.route("/flight_info_by_location", methods=["POST"])
def get_flight_info_with_location():
    city_code = City_code()

    leave = request.json['leave']
    arrive = request.json['arrive']
    date = request.json['date']

    headers = {"Authorization": "APPCODE %s" % config.ALIYUN_APPCODE}
    data = {
        "arrive_code": city_code.get_code_with_city(arrive),
        "leave_code": city_code.get_code_with_city(leave),
        "query_date": date
    }

    rsp = req.post("http://airinfo.market.alicloudapi.com/airInfos",
                   data=data, headers=headers)
    flightInfos = json.loads(rsp.content)

    return jsonify(flightInfos)


@main.route("/flight_info_by_no", methods=["POST"])
def get_flight_info_by_no():
    flight_no = request.json['flightNo']
    date = request.json['date']

    url = "https://www.variflight.com/flight/fnum/%s.html?AE71649A58c77&fdate=%s" % (
        flight_no, date.replace('-', ''))
    headers = {
        "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36"}
    rsp = req.get(url, headers=headers)

    html = etree.HTML(rsp.content)
    try:
        row = html.xpath('//*[@id="list"]/li/div')[0]
    except:
        return jsonify({'isSuccess': False, 'msg': '查无此航班'})
    try:
        leave_location = row.xpath('span[4]/text()')[0]
        arrive_location = row.xpath('span[7]/text()')[0]
        flight_info = {
            'isSuccess': True,
            'flightNo': row.xpath('span[1]/b/a[2]/text()')[0],
            'airlineCompany': row.xpath('span[1]/b/a[1]/text()')[0],
            'tkTime': row.xpath('span[2]/text()')[0].strip(),
            'leavePort': leave_location[:-2] + "机场",
            'leaveBuilding': leave_location[-2:] + "航站楼",
            'arTime': row.xpath('span[5]/text()')[0].strip(),
            'arrivePort': arrive_location[:-2] + "机场",
            'arriveBuilding': arrive_location[-2:] + "航站楼",
            'status': row.xpath('span[9]/text()')[0]
        }
        return jsonify(flight_info)
    except:
        return jsonify({'isSuccess': False, 'msg': "系统内部错误"})
