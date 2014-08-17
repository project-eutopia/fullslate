# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fullslate/version'

Gem::Specification.new do |spec|
  spec.name          = "fullslate"
  spec.version       = Fullslate::VERSION
  spec.authors       = ["Christopher Locke"]
  spec.email         = ["chris@tokyoacademics.com"]
  spec.description   = %q{This gem is used to access the server API for Full Slate}
  spec.summary       = %q{This gem provides the ability to access the Full Slate API by providing methods to handle the server calls, and defines models which are used to wrap up the raw JSON data that is returned by Full Slate.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13"
  spec.add_dependency "activesupport", "~> 4.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "factory_girl", "~> 4.4"
  spec.add_development_dependency "pry", "~> 0.10"
end
