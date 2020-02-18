# -*-coding:utf-8-*-
#
# 机场信息相关 api
#
from flask import request, jsonify
from app.api import api
import requests as req
import json


@api.route("/crowd_status")
def getCrowdStatus():
    rsp = req.get(
        "http://uair.aiplatform.com.cn/UAirServer/app/checkInfo/list.api?airportCode=tsn")
    return jsonify(json.loads(rsp.content))
