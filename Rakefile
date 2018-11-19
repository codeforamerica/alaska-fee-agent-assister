# frozen_string_literal: true

require_relative "config/application"

namespace :lint do
  task :autocorrect do
    require "rubocop/rake_task"
    RuboCop::RakeTask.new
    Rake::Task["rubocop:auto_correct"].execute
  end
end

namespace :bundler do
  task :audit do
    require "bundler/audit/task"
    Bundler::Audit::Task.new
    "bundle:audit"
  end
end

task :brakeman do
  sh "brakeman --no-pager"
end

task default: %w[lint:autocorrect bundler:audit brakeman spec]

Rails.application.load_tasks
