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
        'db': 'aviation'
    }
    MAIL_SERVER = 'smtp.163.com'
    MAIL_PORT = 465
    MAIL_USE_SSL = True
    MAIL_USERNAME = 'marsvet@163.com'
    MAIL_PASSWORD = os.environ.get('MAIL_PASSWORD')
    MAIL_SUBJECT_PREFIX = '[CAI Service]'
    MAIL_SENDER = 'CAI_Service Admin <marsvet@163.com>'

    @staticmethod
    def init_app(app):
        pass
