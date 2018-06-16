module Dotfiles
	module FileReplacer
		def self.replace(source, destination)
		  FileUtils.rm_rf(destination, secure: true)
		  FileLinker.link(source, destination)
		end
	end

	module FileLinker
		require "erb"

		def self.link(source, destination)
		  if File.extname(source) == ".erb"
		    puts "generating ~/#{File.basename(destination)}"
		    File.open(destination, "w") { |f| f.write ERB.new(File.read(source)).result(binding) }
		  else
		    puts "linking ~/#{File.basename(destination)}"
		    FileUtils.ln_s(source, destination)
		  end
		end
	end
end

desc "Copy dotfiles to home directory"
task :dotfiles do
  replace_all = false
  home_dir = File.expand_path("~")

  files = Dir["*"] - %w[brew.sh Brewfile LICENSE.md Rakefile rbenv.sh README.md sublime sublime.sh]
  files.each do |file|
    source = File.join(Dir.pwd, file)
    destination = File.join(home_dir, ".#{file.sub(/\.erb$/, '')}")

    FileUtils.mkdir_p(File.join(home_dir, ".#{File.dirname(file)}")) if file =~ /\//
    if File.exist? destination
      if File.identical?(source, destination)
        puts "identical ~/#{File.basename(destination)}"
      elsif replace_all
        Dotfiles::FileReplacer.replace(source, destination)
      else
        print "overwrite ~/#{File.basename(destination)}? [ynaq] "
        case $stdin.gets.chomp
        when "a"
          replace_all = true
          Dotfiles::FileReplacer.replace(source, destination)
        when "y"
          Dotfiles::FileReplacer.replace(source, destination)
        when "q"
          exit
        else
          puts "skipping ~/#{File.basename(destination)}"
        end
      end
    else
      Dotfiles::FileLinker.link(source, destination)
    end
  end
end

desc "Install dependencies via Homebrew"
task :homebrew do
  install_homebrew unless system "command -v brew >/dev/null"
  system "./brew.sh"
end

desc "Install latest Ruby version"
task :rbenv do
  system "./rbenv.sh"
end

desc "Install system-wide gems"
task :gems do
  system "gem update --system && gem install bundler byebug && gem cleanup"
end

desc "Install Sublime preferences"
task :sublime do
  system "./sublime.sh"
end

desc "Install everything"
task :install => [:dotfiles, :homebrew, :rbenv, :gems, :sublime]

def install_homebrew
  system "ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
end
