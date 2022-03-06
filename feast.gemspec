# frozen_string_literal: true

require_relative "lib/feast/version"

Gem::Specification.new do |spec|
  spec.name = "feast"
  spec.version = Feast::VERSION
  spec.authors = ["OKURA Masafumi"]
  spec.email = ["masafumi.o1988@gmail.com"]

  spec.summary = "Feast is a FastAPI-inspired web framework for Ruby."
  spec.description = "Feast is a web framework. It focuses on speed, simplicity and type safety. It makes developing a web API a feast."
  spec.homepage = "https://github.com/okuramasafumi/feast"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/okuramasafumi/feast/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rack", "~> 2.0"
end
