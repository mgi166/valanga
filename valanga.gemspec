# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'valanga/version'

Gem::Specification.new do |spec|
  spec.name          = "valanga"
  spec.version       = Valanga::VERSION
  spec.authors       = ["mgi166"]
  spec.email         = ["skskoari@gmail.com"]

  spec.summary       = "A Ruby client for REFLEC BEAT."
  spec.description   = "A Ruby client for REFLEC BEAT. Uses PhantomJS to get the scores, achievement rate, etc. Provides Object-oriented API."
  spec.homepage      = "https://github.com/mgi166/valanga"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"

  spec.add_dependency "capybara"
  spec.add_dependency "nokogiri"
  spec.add_dependency "poltergeist"
end
