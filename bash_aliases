# Aliases

## Shortcuts
alias code="cd ~/Code"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias icd="cd ~/Library/Mobile\ Documents"

## Delete Xcode’s DerivedData folder
alias ddd="rm -rf ~/Library/Developer/Xcode/DerivedData"

## An unfortunate solution that fixes sound issues in macOS Sierra
alias fixaudio="sudo killall coreaudiod"

# Toggle visibility of hidden files in Finder
alias hide="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder"
alias show="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder"

## Colorize the output of `ls`
alias ls="ls -aGhlp"

## Show the OS X Login Window
alias lw="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Functions

## Export master branch of Git repositories to a ZIP file
gitzip() {
  git archive --format zip --output ~/Desktop/$(basename $(git rev-parse --show-toplevel)).zip master
}
