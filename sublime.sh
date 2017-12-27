#!/bin/bash

set -e

TARGET_FILE=$HOME/"Library/Application Support/Sublime Text 3/Packages/User"

osascript -e 'quit app "Sublime Text"'

rm -rf "$TARGET_FILE"
ln -Ffs sublime/ "$TARGET_FILE"
