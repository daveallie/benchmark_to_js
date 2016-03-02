# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'benchmark_to_js/version'

Gem::Specification.new do |spec|
  spec.name          = "benchmark_to_js"
  spec.version       = BenchmarkToJs::VERSION
  spec.authors       = ["Dave Allie"]
  spec.email         = ["dave@daveallie.com"]

  spec.summary       = %q{Benchmarks content in views and logs times to JS console.}
  spec.description   = %q{Benchmarks content in views and logs times to the Javascript console.}
  spec.homepage      = "https://github.com/daveallie/benchmark_to_js"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
