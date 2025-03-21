# frozen_string_literal: true

RUBY_ZOOM_VERSION = "0.6.1"

Gem::Specification.new do |spec|
  spec.name = "alexandria-zoom"
  spec.version = RUBY_ZOOM_VERSION
  spec.authors = ["Matijs van Zuijlen", "Laurent Sansonetti", "Ed Summers"]
  spec.email = ["matijs@matijs.net"]

  spec.summary = "Ruby bindings for the Z39.50 Object-Orientation Model (ZOOM)"
  spec.description = <<~TEXT
    Ruby/ZOOM provides a Ruby binding to the Z39.50 Object-Orientation Model
    (ZOOM), an abstract object-oriented programming interface to a subset of
    the services specified by the Z39.50 standard, also known as the
    international standard ISO 23950.
  TEXT
  spec.homepage = "https://github.com/mvz/alexandria-zoom"

  spec.license = "LGPL-2.1-or-later"
  spec.required_ruby_version = ">= 3.1.0"
  spec.platform = Gem::Platform::RUBY

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = File.read("Manifest.txt").split
  spec.extensions = "ext/zoom/extconf.rb"

  spec.add_dependency "pkg-config", "~> 1.6.0"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rake-compiler", "~> 1.2"
  spec.add_development_dependency "rake-manifest", "~> 0.2.0"
  spec.add_development_dependency "rubocop", "~> 1.51"
  spec.add_development_dependency "test-unit", "~> 3.3"
end
