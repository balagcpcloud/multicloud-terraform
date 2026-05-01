#!/usr/bin/env bash
set -euo pipefail
terraform fmt -recursive
for e in envs/dev envs/test envs/prod; do (cd "$e" && terraform init -backend=false && terraform validate); done
