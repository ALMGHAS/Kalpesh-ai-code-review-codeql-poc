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

## POC-2: IaC scanning and Copilot Code Review

This repository also contains a small Terraform sample under [iac/aws/](iac/aws/)
used to test infrastructure-as-code (IaC) code scanning alongside GitHub
Copilot Code Review.

- Terraform files are scanned using [Checkov](https://github.com/bridgecrewio/checkov)
  via the [.github/workflows/checkov-iac-scan.yml](.github/workflows/checkov-iac-scan.yml)
  workflow, which runs on pull requests targeting `main` and on pushes to `main`.
- Checkov results are exported as SARIF and uploaded to GitHub code scanning
  (Security tab), separately from the existing CodeQL default setup for
  application code.
- GitHub Copilot Code Review should be requested on each pull request opened
  from a `poc-2.2-iac/*` branch.

Each pull request should be evaluated for:

1. Whether Checkov detects the introduced misconfiguration.
2. Whether a corresponding GitHub code scanning alert is created.
3. Whether Copilot Code Review leaves a relevant comment.
4. The quality of the remediation recommendation provided.
