# -*-coding:utf-8-*-
#
# 航班信息相关 api
#
from flask import request, jsonify
from app.api import api
from app.models import City_code
from app import config
from lxml import etree
import requests as req
import json


@api.route("/all_location")
def get_all_location():
    city_code = City_code()
    return jsonify(city_code.get_all_city())


@api.route("/flight_info_by_location", methods=["POST"])
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


@api.route("/flight_info_by_no", methods=["POST"])
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
