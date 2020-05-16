# -*-coding:utf-8-*-
import os


basedir = os.path.abspath(os.path.dirname(__file__))


class Config:
    SECRET_KEY = os.environ.get(
        'SECRET_KEY') or "hard to guess string."    # 加密 token 时使用的加密字符串
    JSON_AS_ASCII = False

    # pymysql 配置
    pymysql_config = {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'root',
        'password': os.environ.get('MYSQL_PASSWORD') or 'your db password',
        'db': 'aviation_new'
    }

    # 邮箱配置
    MAIL_SERVER = 'smtp.163.com'
    MAIL_PORT = 465
    MAIL_USE_SSL = True
    MAIL_USERNAME = 'marsvet@163.com'
    MAIL_PASSWORD = os.environ.get('MAIL_PASSWORD')
    MAIL_SUBJECT_PREFIX = '[机场安检助手]'
    MAIL_SENDER = '机场安检助手 Admin <marsvet@163.com>'

    # 阿里云市场航班查询 api 的 APPCODE
    ALIYUN_APPCODE = "797a45df4c3e4876ad887686d674010f"

    # 百度物品识别 api 配置
    BAIDU_AI_API_KEY = "oIuFMt088FYXXGwg0iG5SPQ5"
    BAIDU_AI_SECRET_KEY = "8LrWnedKmqySAUpqkpifmglhsOBMX5rj"
    BAIDU_AI_ACCESS_TOKEN = "24.bdb6d02cd87cba25763ad5a55bff82b5.2592000.1574330191.282335-17300827"
    # token 需要每 30 天重新生成一次

    @staticmethod
    def init_app(app):
        pass
