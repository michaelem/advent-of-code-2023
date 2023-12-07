require "minitest/test_task"
require "syntax_tree/rake_tasks"

Minitest::TestTask.create
SyntaxTree::Rake::CheckTask.new do |t|
  t.source_files = FileList[%w[Gemfile Rakefile lib/**/*.rb test/**/*.rb]]
end
SyntaxTree::Rake::WriteTask.new do |t|
  t.source_files = FileList[%w[Gemfile Rakefile lib/**/*.rb test/**/*.rb]]
end

task default: :test
