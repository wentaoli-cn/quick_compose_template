#!/bin/bash

set -e

if [ $# -ne 2 ]; then
  echo "Usage: $0 SOURCE_DIR TARGET_DIR"
  exit 1
fi

SOURCE=$1
TARGET=$2

if [ ! -d "$SOURCE" ]; then
  echo "No such dir! ($SOURCE)"
  exit 1
fi

mkdir -p "$TARGET"

find "$SOURCE" -type f | while read -r file; do
  rel_path="${file#$SOURCE/}"
  target_file="$TARGET/$rel_path"
  target_dir=$(dirname "$target_file")
  mkdir -p "$target_dir"
  cat "$file" > "$target_file"
done

echo "Done! $SOURCE ➡ $TARGET"
