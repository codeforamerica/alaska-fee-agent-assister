# frozen_string_literal: true

require_relative "config/application"

namespace :lint do
  task :autocorrect do
    require "rubocop/rake_task"
    RuboCop::RakeTask.new
    Rake::Task["rubocop:auto_correct"].execute
  end
end

task :brakeman do
  sh "brakeman --no-pager"
end

task default: %w[lint:autocorrect bundler:audit brakeman spec]

Rails.application.load_tasks

task "db:schema:dump": "db:schema:alphabetize_columns"
