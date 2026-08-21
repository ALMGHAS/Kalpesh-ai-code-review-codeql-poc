# Flask CodeQL POC

A minimal Flask application that serves a user-facing page and a health endpoint.

## Run locally

Create and activate a virtual environment:

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
```

Install the dependency and start the application:

```powershell
python -m pip install -r requirements.txt
python app.py
```

Open <http://127.0.0.1:5000/> in a browser. The health endpoint is available at
<http://127.0.0.1:5000/health>.
