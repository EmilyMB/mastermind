bin_dir = File.expand_path('', __dir__)
$LOAD_PATH.unshift(bin_dir)
require 'cli'

CLI.new($stdin, $stdout).call
