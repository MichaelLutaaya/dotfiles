# Change to Code directory
alias code="cd ~/Code"

# Delete Xcode’s DerivedData folder
alias ddd="rm -rf ~/Library/Developer/Xcode/DerivedData"

# Export master branch of Git repositories to a ZIP file
alias gitzip="git archive --format zip --output ~/Desktop/$(basename $(git rev-parse --show-toplevel)).zip master"

# Colorize the output of `ls`
alias ls="ls -G"

# Show the OS X Login Window
alias lw="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
