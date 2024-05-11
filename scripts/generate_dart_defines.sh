#!/bin/bash

# scripts/generate_dart_defines.sh

case "$1" in
"development") INPUT="env/dev.env"
;;
"staging") INPUT="env/staging.env"
;;
"production") INPUT="env/prod.env"
;;
*)
  echo "Missing arguments [dev|staging|prod]"
  exit 1
;;
esac

file=$(cat $INPUT)

while IFS= read -r line
do
  DART_DEFINES="$DART_DEFINES--dart-define=$line "
done < "$INPUT"

echo "$DART_DEFINES"