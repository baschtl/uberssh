# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uberssh/version'

Gem::Specification.new do |spec|
  spec.name          = "uberssh"
  spec.version       = Uberssh::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Sebastian Oelke"]
  spec.email         = ["dev@soelke.de"]

  spec.summary       = %q{Connect to one of your multiple uberspaces with just one command.}
  spec.description   = %q{Uberssh is a script that let's you select to which of your uberspaces you want to connect to via ssh in just a few key strokes.}
  spec.homepage      = "https://github.com/baschtl/uberssh.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler",               "~> 1.9"

  spec.add_development_dependency "rake",      "~> 10.0"
  spec.add_development_dependency "rspec",     "~> 3"
  spec.add_development_dependency "rspec-its", "~> 1.2"
end
