#!/bin/bash

set -e

brew analytics off
brew doctor

brew update
brew bundle
brew cask outdated | xargs brew cask reinstall

brew cleanup --prune=1 -s
brew cask cleanup
brew bundle dump --force --global
brew bundle cleanup --force --global
