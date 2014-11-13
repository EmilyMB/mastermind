bin_dir = File.expand_path('../bin', __dir__)
lib_dir = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib_dir, bin_dir)

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
