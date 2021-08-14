require "pathname"

module Dotfiles
  module Install
    extend self

    def run(args)
      replace_all = args.fetch(:assume_yes)

      files_to_sync.each do |source|
        destination = File.join(ENV.fetch("HOME"), ".#{File.basename(source)}")

        if File.exist?(destination)
          if File.identical?(source, destination)
            puts "identical #{destination}"
          elsif replace_all
            replace(source, destination)
          else
            result = overwrite_prompt(destination)
            case result
            when "a", "y"
              replace_all = true if result == "a"
              replace(source, destination)
            when "q"
              exit
            else
              puts "skipping #{destination}"
            end
          end
        else
          link(source, destination)
        end
      end
    end

    private

    def link(source, destination)
      puts "linking #{destination}"
      FileUtils.ln_s(source, destination)
    end

    def replace(source, destination)
      FileUtils.rm_rf(destination, secure: true)
      link(source, destination)
    end

    def overwrite_prompt(destination)
      print "overwrite #{destination}? [ynaq] "
      $STDIN.gets.chomp
    end

    def files_to_sync
      project_root = Pathname.new(__dir__).parent.parent
      dotfiles_directory = File.join(project_root, "dotfiles")

      Dir["*", base: dotfiles_directory].map do |basename|
        File.join(dotfiles_directory, basename)
      end
    end
  end
end
