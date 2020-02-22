from flask import current_app
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer, SignatureExpired, BadSignature


def generate_auth_token(data, expiration=3600):
    serial = Serializer(
        current_app.config["SECRET_KEY"], expires_in=expiration)
    return serial.dumps(data).decode('ascii')


def get_auth_token_data(token):   # 验证 token
    serial = Serializer(current_app.config["SECRET_KEY"])
    try:
        data = serial.loads(token)
    except SignatureExpired:
        return None  # valid token, but expired
    except BadSignature:
        return None  # invalid token
    return data
