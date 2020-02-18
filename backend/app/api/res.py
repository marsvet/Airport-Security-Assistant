# -*-coding:utf-8-*-
#
# 物品相关 api
#
from flask import request, jsonify
from app.api import api
from app.models import Res
from app import config
from base64 import b64encode
import requests as req
import os
import json
import re


@api.route("/all_res_name")
def get_all_res_name():
    res = Res()
    return jsonify(res.get_all_res_name())


@api.route("/res_info", methods=["POST"])
def get_res_info():
    res_name = request.json['res_name']
    res = Res()
    if res.get_res_info_by_resname(res_name):
        exist_images = os.listdir("raw/img/res")
        to_return = {
            'isSuccess': True,
            '物品名称': res.res_name,
            '附加说明': res.description,
            '限定规格': res.limit,
            '携带方式': res.carry_method,
            '物品所属分类': res.res_class,
            '图片地址': "/raw/img/res/%s.jpeg" % res_name if res_name + ".jpeg" in exist_images else None
        }
        return jsonify(to_return)
    else:
        return jsonify({'isSuccess': True, '携带方式': '可以随身携带'})


@api.route("/res_info_by_image", methods=["POST"])
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
                exist_images = os.listdir("raw/img/res")
                to_return = {
                    'isSuccess': True,
                    '物品名称': res.res_name,
                    '附加说明': res.description,
                    '限定规格': res.limit,
                    '携带方式': res.carry_method,
                    '物品所属分类': res.res_class,
                    '图片地址': "/raw/img/res/%s.jpeg" % ob if ob + ".jpeg" in exist_images else None
                }
                return jsonify(to_return)
    return jsonify({"isSuccess": False, "msg": "找不到此物品"})
