import sqlite3

from flask import Flask, jsonify, request


app = Flask(__name__)


@app.get("/")
def index():
    return "<h1>CodeQL POC</h1><p>The Flask application is running.</p>"


@app.get("/health")
def health():
    return jsonify(status="ok")


@app.get("/search")
def search_user():
    name = request.args.get("name", "")
    conn = sqlite3.connect(":memory:")
    cur = conn.cursor()
    cur.execute("CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT)")
    cur.execute("INSERT INTO users (name) VALUES ('alice'), ('bob')")
    rows = cur.execute(f"SELECT id, name FROM users WHERE name = '{name}'").fetchall()
    conn.close()
    return jsonify(results=rows)


if __name__ == "__main__":
    app.run()
