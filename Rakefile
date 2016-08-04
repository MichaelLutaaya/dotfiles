# https://github.com/ryanb/dotfiles/blob/ca4d95179b62ceb1a760a2922953edd01d75c382/Rakefile
desc "Install dotfiles in home directory"
task :install do
  files = Dir["*"] - %w[LICENSE.md Rakefile README.md]
  files.each do |file|
    replace_file(file)
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
