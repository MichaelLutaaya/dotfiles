# Aliases

## Change to Code directory
alias code="cd ~/Code"

## Delete Xcode’s DerivedData folder
alias ddd="rm -rf ~/Library/Developer/Xcode/DerivedData"

## An unfortunate solution that fixes sound issues in macOS Sierra
alias fixaudio="sudo killall coreaudiod"

# Toggle visibility of hidden files in Finder
alias hideHidden="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder"
alias showHidden="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder"

## Colorize the output of `ls`
alias ls="ls -G"

## Show the OS X Login Window
alias lw="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Functions

## Export master branch of Git repositories to a ZIP file
gitzip() {
  git archive --format zip --output ~/Desktop/$(basename $(git rev-parse --show-toplevel)).zip master
}
