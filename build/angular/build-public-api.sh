#! /bin/bash

set -Eeuo pipefail

SRC="./src"
API_FILE="./public_api.ts"
CWD="${PWD}"

cd "$SRC"

# shellcheck disable=SC2227
find . -name "*.ts" ! -name "public_api.ts" -exec echo "export * from '"'{}'"';" > "$API_FILE" \;

if [[ $(uname) == "Darwin" ]]; then
  sed -i '' -e 's/\.ts//g' "$API_FILE"
else
  sed -i 's/\.ts//g' "$API_FILE"
fi

cd "$CWD"
