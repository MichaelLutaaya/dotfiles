require_relative "lib/dotfiles"

desc "Install dotfiles into $HOME"
task :install, [:assume_yes] do |_, args|
  args.with_defaults(assume_yes: false)
  Dotfiles::Install.run(args)
end
