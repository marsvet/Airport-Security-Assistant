from flask import Flask
from config import Config
from pymysql import connect
from flask_login import LoginManager
from flask_mail import Mail

config = Config()
db = connect(**config.pymysql_config)
login_manager = LoginManager()
login_manager.login_view = 'auth.login'
mail = Mail()

def create_app():
	app = Flask(__name__)
	app.config.from_object(config)
	config.init_app(app)
	login_manager.init_app(app)
	mail.init_app(app)

	from .main import main as main_blueprint
	app.register_blueprint(main_blueprint)
	from .auth import auth as auth_blueprint
	app.register_blueprint(auth_blueprint)

	return app
