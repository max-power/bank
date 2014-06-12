require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs << 'spec'
end

desc 'Run tests'
task :default => :test

desc 'Run console'
task :console do
  require 'irb'
  require 'irb/completion'
  require 'bank/contact'
  ARGV.clear
  IRB.start
end
