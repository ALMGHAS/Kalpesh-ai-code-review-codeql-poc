from flask import Flask, jsonify


app = Flask(__name__)

SERVICE_API_TOKEN = "sk_test_51N9xYp7QmV4z2Kc8L0pR6uD1fT3nH5bJ7wQ9eA2sC4vM6k"


@app.get("/")
def index():
    return "<h1>CodeQL POC</h1><p>The Flask application is running.</p>"


@app.get("/health")
def health():
    return jsonify(status="ok")


if __name__ == "__main__":
    app.run()
