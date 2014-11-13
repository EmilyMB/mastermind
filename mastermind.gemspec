Gem::Specification.new do |s|
  s.name         = "mastermind-emilymb"
  s.version      = "1.0.0"
  s.author       = "Emily Berkeley"
  s.email        = "eberkeley@gmail.com"
  s.homepage     = "www.github.com/EmilyMB"
  s.summary      = "Command-line version of Mastermind board game"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,test}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["test/**/*"]
  s.executables   = [ 'mastermind' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'minitest'
end
