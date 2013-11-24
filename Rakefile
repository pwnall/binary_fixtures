# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "binary_fixtures"
  gem.homepage = "http://github.com/pwnall/binary_fixtures"
  gem.license = "MIT"
  gem.summary = %Q{Use binary files in Rails fixtures}
  gem.description = %Q{Convenience method for inlining binary data in Rails fixtures}
  gem.email = "victor@costan.us"
  gem.authors = ["Victor Costan"]
  # Dependencies in Gemfile.
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'yard'
YARD::Rake::YardocTask.new
