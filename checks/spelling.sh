#!/usr/bin/env bash

set -e
set -o pipefail

npm install -g cspell
git fetch origin main:main
git diff --name-only --diff-filter=AM main $HEAD | grep '\.md$' | xargs --no-run-if-empty -L1 npx cspell -c ./checks/spelling-config.json
