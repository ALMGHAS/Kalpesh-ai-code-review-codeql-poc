from flask import Flask, jsonify


app = Flask(__name__)


@app.get("/")
def index():
    return "<h1>CodeQL POC</h1><p>The Flask application is running.</p>"


@app.get("/health")
def health():
    return jsonify(status="ok")


if __name__ == "__main__":
    app.run()
