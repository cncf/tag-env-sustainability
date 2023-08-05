#!/usr/bin/env bash

set -e
set -o pipefail

npm install -g cspell
# git fetch origin main:main
changed_files=$(git diff --name-only --diff-filter=AM main $HEAD | grep '\.md$' || true)

if [ -n "$changed_files" ]; then
    echo "Running spelling check on the following files:"
    echo "$changed_files"
    echo "--------------------------------------------"
    echo "$changed_files" | xargs --no-run-if-empty -L1 npx cspell -c ./checks/spelling-config.json
else
    echo "No markdown files changed. Skipping spelling check."
fi