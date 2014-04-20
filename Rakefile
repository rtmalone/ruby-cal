#!/usr/bin/env ruby
# -*- ruby -*-
$LOAD_PATH << "lib"

require 'rake/testtask'
Rake::TestTask.new() do |t|
  t.pattern = "test/test_*.rb"
end

desc "Run tests"
task :default => :test

desc "Load Cal in console"
task :console do
  require 'irb'
  require 'irb/completion'
  require 'month'
  ARGV.clear
  IRB.start
end
