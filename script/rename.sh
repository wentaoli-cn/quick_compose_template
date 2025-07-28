#!/bin/bash

set -e

if [ $# -ne 1 ]; then
  echo "Usage: $0 DIR"
  exit 1
fi

DIR=$1

if [ ! -d "$DIR" ]; then
  echo "No such dir! ($DIR)"
  exit 1
fi

cd "$DIR"

while true; do
  read -rp "Old name: " OLD
  if [[ -z "$OLD" ]]; then
      break
  fi

  read -rp "New name: " NEW
  if [[ -z "$OLD" ]]; then
      continue
  fi

  echo "Preview: $OLD ➡ $NEW"
  read -rp "Proceed? (y/n): " ANSWER

  if [[ "$ANSWER" =~ ^[yY]$ ]]; then
    find . -type f -name "$OLD" | while read -r FILE; do
      DIRNAME=$(dirname "$FILE")
      BASENAME=$(basename "$FILE")
      NEWBASENAME="${BASENAME//$OLD/$NEW}"
      mv -i "$FILE" "$DIRNAME/$NEWBASENAME"
    done
    echo "Done!"
  else
    echo "Skipped!"
  fi

  echo "****************"
done
