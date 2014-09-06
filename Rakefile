require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.warning = true
  t.pattern = "test/**/*_test.rb"
  t.libs    << "lib"
end
task default: :test
