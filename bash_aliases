# Aliases

## Shortcuts
alias code="cd ~/Code"
alias dl="cd ~/Downloads"
alias dotfiles="rake -f ~/Code/dotfiles/Rakefile"
alias dt="cd ~/Desktop"
alias icd="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"
alias thesis="cd ~/Code/mcs-thesis-latex"

# Toggle visibility of hidden files in Finder
alias hide="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder"
alias show="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder"

## Colorize the output of `ls`
alias ls="ls -aGhlp"

## Xcode
alias ddd="rm -rf ~/Library/Developer/Xcode/DerivedData"
alias xcstable="sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"
alias xcbeta="sudo xcode-select -s /Applications/Xcode-beta.app/Contents/Developer"

# Functions

## Export master branch of Git repositories to a ZIP file
gitzip() {
  git archive --format zip --output ~/Desktop/$(basename $(git rev-parse --show-toplevel)).zip master
}
