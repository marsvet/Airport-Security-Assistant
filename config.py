import os


basedir = os.path.abspath(os.path.dirname(__file__))


class Config:
    SECRET_KEY = "hard to guess string."
    JSON_AS_ASCII = False
    pymysql_config = {
        'host': '47.94.94.136',
        'port': 3306,
        'user': 'root',
        'password': os.environ.get('MYSQL_PASSWORD'),
        'db': 'aviation_new'
    }
    MAIL_SERVER = 'smtp.163.com'
    MAIL_PORT = 465
    MAIL_USE_SSL = True
    MAIL_USERNAME = 'marsvet@163.com'
    MAIL_PASSWORD = os.environ.get('MAIL_PASSWORD')
    MAIL_SUBJECT_PREFIX = '[CAI Service]'
    MAIL_SENDER = 'CAI_Service Admin <marsvet@163.com>'

    ALIYUN_APPCODE = "797a45df4c3e4876ad887686d674010f"

    BAIDU_AI_API_KEY = "oIuFMt088FYXXGwg0iG5SPQ5"
    BAIDU_AI_SECRET_KEY = "8LrWnedKmqySAUpqkpifmglhsOBMX5rj"
    BAIDU_AI_ACCESS_TOKEN = "24.bdb6d02cd87cba25763ad5a55bff82b5.2592000.1574330191.282335-17300827"    # token 需要每 30 天重新生成一次

    @staticmethod
    def init_app(app):
        pass
