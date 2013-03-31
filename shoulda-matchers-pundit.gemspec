# -*- encoding: utf-8 -*-

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'shoulda/matchers/pundit/version'

Gem::Specification.new do |spec|
  spec.name          = "shoulda-matchers-pundit"
  spec.version       = Shoulda::Matchers::Pundit::VERSION.dup
  spec.authors       = ["David Conner"]
  spec.email         = ["dconner.pro@gmail.com"]
  spec.description   = %q{Shoulda Matchers for Pundit & Setup for RSpec/Minitest}
  spec.summary       = %q{Shoulda Matchers for Pundit & Setup for RSpec/Minitest}
  spec.homepage      = "http://github.com/dcunited001/shoulda-matchers-pundit"
  spec.license       = "MIT"
  spec.date          = Time.now.strftime("%Y-%m-%d")

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "shoulda-matchers", ">= 1.4.1"
  spec.add_dependency "pundit", "~> 0.2.0"

  spec.add_development_dependency "rake", ">= 0.9.2"
  spec.add_development_dependency "minitest-matchers", ">= 1.2.0"

end
