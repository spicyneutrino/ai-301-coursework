#!/usr/bin/env bash
set -eu
printf '$ git rev-parse HEAD\n'
git rev-parse HEAD
printf '$ cp .env.example .env\n'
cp .env.example .env
printf '$ grep -nE "OPENROUTER_API_KEY|OPENAI_API_KEY|LLM_PROVIDER|Options:" README.md .env.example .env docs/SETUP.md\n'
grep -nE 'OPENROUTER_API_KEY|OPENAI_API_KEY|LLM_PROVIDER|Options:' README.md .env.example .env docs/SETUP.md
printf '$ grep -nE "llm_provider|openai_api_key|openrouter" core/config.py\n'
grep -nE 'llm_provider|openai_api_key|openrouter' core/config.py
printf '$ grep -n OPENROUTER_API_KEY .env\n'
if grep -n 'OPENROUTER_API_KEY' .env; then
  printf 'OPENROUTER_API_KEY present in copied example\n'
else
  printf 'OPENROUTER_API_KEY absent in copied example (grep exit 1)\n'
fi
printf '$ git status --short\n'
git status --short
