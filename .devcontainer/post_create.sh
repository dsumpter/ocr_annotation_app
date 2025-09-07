#!/bin/bash
set -euo pipefail

# Install uv and llm
curl -LsSf https://astral.sh/uv/install.sh | sh
uvx install llm
llm install llm-github-models
llm models default github/gpt-4.1
uvx install poethepoet
uvx install modal
npm install -g @intellectronica/ruler
npm install -g @openai/codex


# Only run uv sync if a pyproject.toml exists
if [[ -f pyproject.toml ]]; then
  echo "pyproject.toml found, running uv sync..."
  uv sync
else
  echo "No pyproject.toml found, skipping uv sync."
fi
