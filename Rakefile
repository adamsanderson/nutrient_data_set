require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

desc "Build a new version" 
task :build do
  `gem build nutrient_db.gemspec`
end

desc "Removes build artifacts" 
task :clean do
  rm Dir["nutrient_db*.gem"]
end

task :default => :test