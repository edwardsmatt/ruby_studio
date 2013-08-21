Gem::Specification.new do |s|
  s.name         = "studio_game"
  s.version      = "1.0.0"
  s.author       = "Matt Edwards"
  s.email        = "edwardsmatt@github"
  s.homepage     = "https://github.com/edwardsmatt/ruby_studio"
  s.summary      = "Studio Game created Pragmatic Studio Ruby Course"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.license  = File.read(File.join(File.dirname(__FILE__), 'LICENSE'))

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end

