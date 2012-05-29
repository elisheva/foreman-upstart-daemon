# -*- encoding: utf-8 -*-
require File.expand_path('../lib/foreman-upstart-daemon/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Elisheva Kantor", "Zohar Arad"]
  gem.email         = ["kantor@quicklizard.com", "zohar@quicklizard.com"]
  gem.description   = %q{Exports upstart-daemon scripts from Foreman}
  gem.summary       = %q{An exporter for Foreman - export the application to upstart as daemon}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "foreman-upstart-daemon"
  gem.require_paths = ["lib"]
  gem.version       = Foreman::Upstart::Daemon::VERSION
end
