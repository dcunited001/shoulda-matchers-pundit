require 'rubygems'
require 'bundler/setup'
require 'rake/testtask'
require "bundler/gem_tasks"

Rake::TestTask.new do |t|
  t.libs << "spec"
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end

task :default => :test
