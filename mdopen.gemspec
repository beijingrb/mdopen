lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mdopen/version"

Gem::Specification.new do |spec|
  spec.name          = "mdopen"
  spec.version       = Mdopen::VERSION
  spec.authors       = ["B1nj0y"]
  spec.email         = ["idegorepl@gmail.com"]

  spec.summary       = %q{mdopen is a command to preview a markdown file.}
  spec.description   = %q{mdopen is a command tool to preview a markdown file in a GitHub template.}
  spec.homepage      = "https://github.com/beijingrb/mdopen"
  spec.license       = "MIT"

  spec.files         = %w[mdopen.gemspec] + Dir["*.md", "bin/*", "lib/**/*.rb", "lib/templates/*.erb"]
  spec.require_paths = ["lib"]
  spec.executables   = %w[mdopen]

  spec.add_dependency "os", "~> 1.0"
  spec.add_dependency "redcarpet", "~> 3.4"
  spec.add_dependency "tilt", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
