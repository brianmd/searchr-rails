$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "searchr_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "searchr_rails"
  s.version     = SearchrRails::VERSION
  s.authors     = ["bmd"]
  s.email       = ["brian@murphydye.com"]
  s.homepage    = "http://murphydye.com/"
  s.summary     = "Summary of SearchrRails."
  s.description = "Description of SearchrRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 4.2.3'
  s.add_dependency 'haml'
  #s.add_dependency "searchr"
end
