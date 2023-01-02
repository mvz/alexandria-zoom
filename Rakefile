# frozen_string_literal: true

require "rubygems"
require "rake"
require "rake/clean"
require "rake/testtask"
require "rdoc/task"
require "rake/manifest/task"
require "rake/packagetask"
require "rake/extensiontask"
require "rubygems/package_task"

CLEAN.include "**/*.o"
CLEAN.include "**/*.so"
CLEAN.include "**/Makefile"
CLEAN.include "**/*.log"
CLEAN.include "pkg"

task default: [:compile, :test, :package, "manifest:check"]

Rake::ExtensionTask.new("zoom")

task :package do
  system("gem build alexandria-zoom.gemspec")
end

Rake::TestTask.new("test") do |t|
  t.test_files = FileList["test/*_test.rb"]
  t.ruby_opts = ["-r test/unit", "-I ext", "-r zoom"]
  t.verbose = true
end

Rake::TestTask.new("live_test") do |t|
  t.test_files = FileList["test/*_live.rb"]
  t.ruby_opts = ["-r test/unit", "-I ext", "-r zoom"]
  t.verbose = true
end

Rake::Manifest::Task.new do |t|
  t.patterns = ["ext/**/*.{c,h,rb}",
                "sample/**/*.rb",
                "README.md", "ChangeLog", "Makefile", "LICENSE"]
end

Rake::RDocTask.new do |rd|
  rd.main = "README.md"
  rd.rdoc_files.include("README.md", "ext/*.c")
end
