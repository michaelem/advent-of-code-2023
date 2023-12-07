require "minitest/test_task"
require "syntax_tree/rake_tasks"

Minitest::TestTask.create

RUBY_FILES = FileList[%w[Gemfile Rakefile advent-cli lib/**/*.rb test/**/*.rb]]
SyntaxTree::Rake::CheckTask.new { |t| t.source_files = FileList[RUBY_FILES] }
SyntaxTree::Rake::WriteTask.new { |t| t.source_files = FileList[RUBY_FILES] }

task default: :test
