require "erb"

# https://github.com/ryanb/dotfiles/blob/ca4d95179b62ceb1a760a2922953edd01d75c382/Rakefile
desc "Install dotfiles in home directory"
task :install do
  replace_all = false
  files = Dir["*"] - %w[Brewfile LICENSE.md Rakefile README.md]
  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV["HOME"], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV["HOME"], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(files)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when "a"
          replace_all = true
          replace_file(file)
        when "y"
          replace_file(file)
        when "q"
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

desc "Install dependencies via Homebrew"
task :homebrew => :install do
  install_homebrew unless system "command -v brew >/dev/null"
  system "brew tap homebrew/bundle && brew update && brew bundle && brew cleanup"
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV["HOME"], ".#{file.sub(/\.erb$/, '')}"), "w") do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def install_homebrew
  system "ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
end
