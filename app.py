import sqlite3

from flask import Flask, jsonify


app = Flask(__name__)


@app.get("/")
def index():
    return "<h1>CodeQL POC</h1><p>The Flask application is running.</p>"


@app.get("/health")
def health():
    return jsonify(status="ok")


@app.get("/orders/<order_id>")
def get_order(order_id):
    conn = sqlite3.connect(":memory:")
    cur = conn.cursor()
    cur.execute("CREATE TABLE orders (id INTEGER PRIMARY KEY, item TEXT)")
    cur.execute("INSERT INTO orders (item) VALUES ('book'), ('pen')")
    sql = "SELECT id, item FROM orders WHERE id = " + order_id
    row = cur.execute(sql).fetchall()
    conn.close()
    return jsonify(result=row)


if __name__ == "__main__":
    app.run()
