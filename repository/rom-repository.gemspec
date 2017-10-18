require File.expand_path('../lib/rom/repository/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'rom-repository'
  gem.summary       = 'Repository abstraction for rom-rb'
  gem.description   = gem.summary
  gem.author        = 'Piotr Solnica'
  gem.email         = 'piotr.solnica+oss@gmail.com'
  gem.homepage      = 'http://rom-rb.org'
  gem.require_paths = ['lib']
  gem.version       = ROM::Repository::VERSION.dup
  gem.files         = Dir['CHANGELOG.md', 'LICENSE', 'README.md', 'lib/**/*']
  gem.license       = 'MIT'

  gem.add_runtime_dependency 'rom-mapper', '~> 1.0'
  gem.add_runtime_dependency 'dry-struct', '~> 0.3'

  gem.add_development_dependency 'rake', '~> 11.2'
  gem.add_development_dependency 'rspec', '~> 3.5'
end
