# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bank/version'

Gem::Specification.new do |spec|
  spec.name          = 'bank-contact'
  spec.version       = Bank::VERSION
  spec.authors       = ['Kevin']
  spec.email         = ['kevin.melchert@gmail.com']
  spec.summary       = %q{IBAN + SWIFT/BIC}
  spec.description   = %q{IBAN + SWIFT/BIC: Information, Validation and Formatting.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest', '~> 4.2'
  spec.add_development_dependency 'activemodel', '~> 4.0.0'
end
