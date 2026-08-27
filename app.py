from flask import Flask, jsonify, request


app = Flask(__name__)


@app.get("/")
def index():
    return "<h1>CodeQL POC</h1><p>The Flask application is running.</p>"


@app.get("/health")
def health():
    return jsonify(status="ok")


@app.get("/welcome")
def welcome():
    name = request.args.get("name", "friend")
    return f"<h2>Welcome, {name}</h2>"


if __name__ == "__main__":
    app.run()
