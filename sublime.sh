#!/bin/bash

set -e

SOURCE_FILE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/sublime/"
TARGET_FILE=$HOME/"Library/Application Support/Sublime Text 3/Packages/User"

osascript -e 'quit app "Sublime Text"'

rm -rf "$TARGET_FILE"
ln -Ffs "$SOURCE_FILE" "$TARGET_FILE"
