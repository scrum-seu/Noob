from flask import Flask

app = Flask(__name__)
# app.config.from_object(config[config_name])
# config[config_name].init_app(app)  # 通过config.py统一接口


@app.route('/')
def hello_world():
    return 'Hello World!'


if __name__ == '__main__':
    app.run(host='0.0.0.0')
