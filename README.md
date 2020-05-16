# 机场安检助手

我的大创项目之一，也是我的第一个 vue 项目，由于是边学边做的，所以问题不少。现在项目已经结题，以后不会再更新了，仅留作纪念。

技术栈：

- 前端：vue + vue-router + vuex + vuetify + axios
- 后端：flask

## 如何使用

1. 克隆此项目到服务器

   ```bash
   $ git clone git@github.com:marsvet/Airport-security-assistant.git /var/www/Airport-security-assistant
   ```

2. 进入项目根目录，将 backup.sql 导入 mysql 数据库中。

3. 修改 frontend/src/common/const.js 文件中的 apiServer（api 服务器地址） 和 staticServer（静态资源服务器地址）

4. 打包构建前端代码

   ```bash
   $ cd frontend
   $ yarn
   $ npm run build
   ```

5. 启动 gunicorn 服务器运行后端代码

   ```bash
   $ cd ../backend
   $ pipenv install
   $ pipenv shell
   $ pipenv install gunicorn
   $ ~/.local/share/virtualenvs/backend-xxx/bin/gunicorn -b 0.0.0.0:81 main:app # 端口：81
   ```

6. 配置 nginx 服务器，添加以下内容：

   ```bash
   server {
   	listen 80;  # 端口：80
   	server_name localhost;

   	access_log  /var/log/nginx/access.log;
   	error_log  /var/log/nginx/error.log;

   	location /  {
   		root /var/www/Airport-security-assistant/frontend/dist;
   		try_files $uri $uri/ /index.html;
   	}

   	location /raw  {
   		alias /var/www/Airport-security-assistant/backend/raw;
   	}

   	location /api {
   		proxy_pass         http://localhost:81/;
   		proxy_redirect     off;

   		proxy_set_header   Host             $http_host;
   		proxy_set_header   X-Real-IP        $remote_addr;
   		proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
   	}
   }
   ```

## TODO

- [ ] 登录注册功能
- [ ] API 使用 token 进行身份认证
