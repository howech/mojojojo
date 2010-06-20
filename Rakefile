require 'rake'

DONOTINSTALL = %w[Rakefile README LICENSE node_utils]

desc "install the command files into user's bin directory"
task :install do
  make_bin_dir
  (Dir['*'] - DONOTINSTALL).sort.each do |file|
    link_file(file)
  end
end

#
# Forces a link from here to ~/bin
#
def link_file(file, quiet = false)
  system %Q{ln -sf "$PWD/#{file}" "$HOME/bin/#{file}"}
end

#
# Assuming you have ~/bin in your path but it may not exist yet?
#
def make_bin_dir
  system %Q{ mkdir -p "$HOME/bin" }
end
