from flask import Flask, jsonify, render_template_string, request


app = Flask(__name__)


@app.get("/")
def index():
    return "<h1>CodeQL POC</h1><p>The Flask application is running.</p>"


@app.get("/health")
def health():
    return jsonify(status="ok")


@app.get("/preview")
def preview():
    body = request.args.get("body", "")
    template = f"<section><h3>Preview</h3><div>{body}</div></section>"
    return render_template_string(template)


if __name__ == "__main__":
    app.run()
