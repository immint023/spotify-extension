#!/bin/bash

CHANGED_FILES=$(git diff --cached --name-only --diff-filter=ACMR "*.js" "*.jsx" "*.ts" "*.tsx" | sed 's| |\\ |g')

[[ -z "$CHANGED_FILES" ]] && exit 0

echo "Running eslint 🚀🚀"
echo "$CHANGED_FILES" | xargs ./node_modules/.bin/eslint

if [ $? -ne 0 ]; then
  echo "Failed on running eslint. Please check your code again."
  exit 1
fi

echo "Done eslint ✨✨"

exit 0
