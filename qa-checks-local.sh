#!/usr/bin/env bash
echo -e "\033[1;35m Checking presence of QA tools...If not present, a tool will be installed.\033[0m\n"

npm list markdownlint-cli2 || npm install -g markdownlint-cli2
npm list markdown-link-check || npm install -g markdown-link-check
npm list cspell || npm install -g cspell

echo -e "\033[1;35m Checking modified files...\033[0m\n"
files=$(git diff --name-only --diff-filter=AM main $HEAD | grep '\.md$')

echo -e "\033[1;35m ######## LINTING ########\033[0m\n"
echo -e "\033[1;35m Running Markdown linting on modified files...\033[0m\n"
for file in $files; do
    npx markdownlint-cli2 --fix --config ./.markdownlint.json "$file"
done

echo -e "\n\033[1;35m ######## SPELLING ########\033[0m\n"
echo -e "\033[1;35m Running spelling validation on modified files...\033[0m\n"
for file in $files; do
    npx cspell --config ./cspell.json "$file"
done

echo -e "\n\033[1;35m ######## LINKS ########\033[0m\n"
echo -e "\033[1;35m Running Markdown links validation on modified files...\033[0m\n"
for file in $files; do
    npx markdown-link-check --config ./link-config.json --progress --verbose "$file"
done

echo -e "\n\033[1;32m Done!\033[0m"