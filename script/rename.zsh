#!/usr/bin/env zsh

autoload -U zmv

read "DIR?dir:"
if [[ ! -d "$DIR" ]]; then
  echo "no such dir!"
  exit 1
else
  cd "$DIR"
fi

while true; do
  read "OLD?old name:"
  [[ -z "$OLD" ]] && break

  read "NEW?new name:"

  zmv -n '(**/)'$OLD '$1'$NEW

  echo "proceed? (y/n)"
  read "ANSWER?"
  if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" ]]; then
    zmv '(**/)'$OLD '$1'$NEW
  else
    exit 0
  fi

  echo "****************"
done
