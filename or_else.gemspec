# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'or_else/version'

Gem::Specification.new do |spec|
  spec.name          = 'or_else'
  spec.version       = OrElse::VERSION
  spec.authors       = ['alexpeachey']
  spec.email         = ['alex.peachey@originate.com']
  spec.summary       = %q{A simple Maybe/Option implementation.}
  spec.description   = %q{A simple Maybe/Option implementation.}
  spec.homepage      = 'https://github.com/Originate/or_else'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end