from app import flask_app

if __name__ == "__main__":
    debug = True
    host = "172.16.128.195"
    flask_app.run(host, debug=debug)