require "erb"

desc "Copy files to home directory"
task :copy_files_to_home do
  replace_all = false
  home_dir = File.expand_path("~")

  files = Dir["*"] - %w[Brewfile LICENSE.md Rakefile README.md]
  files.each do |file|
    source = File.join(Dir.pwd, file)
    destination = File.join(home_dir, ".#{file.sub(/\.erb$/, '')}")

    FileUtils.mkdir_p(File.join(home_dir, ".#{File.dirname(file)}")) if file =~ /\//
    if File.exist? destination
      if File.identical?(source, destination)
        puts "identical ~/#{File.basename(destination)}"
      elsif replace_all
        replace(source, destination)
      else
        print "overwrite ~/#{File.basename(destination)}? [ynaq] "
        case $stdin.gets.chomp
        when "a"
          replace_all = true
          replace(source, destination)
        when "y"
          replace(source, destination)
        when "q"
          exit
        else
          puts "skipping ~/#{File.basename(destination)}"
        end
      end
    else
      link_file(file)
    end
  end
end

desc "Install dependencies via Homebrew"
task :homebrew do
  install_homebrew unless system "command -v brew >/dev/null"
  system "brew analytics off && brew tap homebrew/bundle && brew update && brew bundle && brew cleanup"
  system "rbenv install --skip-existing 2.4.1 && rbenv global 2.4.1"
end

desc "Install dotfiles"
task :install => [:copy_files_to_home, :homebrew]

def replace(source, destination)
  FileUtils.rm_rf(destination, secure: true)
  link(source, destination)
end

def link(source, destination)
  if File.extname(source) == ".erb"
    puts "generating ~/#{File.basename(destination)}"
    File.open(destination, "w") { |f| f.write ERB.new(File.read(source)).result(binding) }
  else
    puts "linking ~/#{File.basename(destination)}"
    FileUtils.ln_s(source, destination)
  end
end

def install_homebrew
  system "ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
end
