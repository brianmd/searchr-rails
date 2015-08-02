$:.push File.expand_path("../lib", __FILE__)

require "searchr_rails/version"

Gem::Specification.new do |s|
  s.name        = 'searchr_rails'
  s.version     = SearchrRails::VERSION
  s.authors     = ['Brian Murphy-Dye']
  s.email       = ['brian@murphydye.com']
  s.homepage    = ''
  s.summary     = 'Display document weights to show why one document is higher rated than another.'
  s.description = 'Used with searchr gem. Currently works only with Solr.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.3'
  s.add_dependency 'haml'
  #s.add_dependency 'searchr'
end
