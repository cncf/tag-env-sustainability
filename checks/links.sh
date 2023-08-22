#!/usr/bin/env bash

npm list markdown-link-check || npm install markdown-link-check
for file_name in $(git diff --name-only $HEAD main | grep '\.md$'); do
  npx markdown-link-check --config ./checks/link-config.json --progress --verbose "$file_name"
done
