from flask import Blueprint

api = Blueprint('api', __name__)

# 写在最后是为了防止循环导入
from app.api import users, res, flightInfo, airportInfo
