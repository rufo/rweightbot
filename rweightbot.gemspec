# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rweightbot/version'

Gem::Specification.new do |gem|
  gem.name          = "rweightbot"
  gem.version       = RWeightbot::VERSION
  gem.authors       = ["Rufo Sanchez"]
  gem.email         = ["rufo@rufosanchez.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.add_dependency "mechanize", "~>2.5.1"
  gem.add_development_dependency "rspec", "~>2.12"
  gem.add_development_dependency "vcr", "~>2.3.0"
  gem.add_development_dependency "fakeweb", "~>1.3.0"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
