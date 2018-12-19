namespace :db do
  namespace :schema do
    # https://www.pgrs.net/2008/03/13/alphabetize-schema-rb-columns/
    task :alphabetize_columns do
      warn "Dumping schema with alphabetized columns"
      ActiveRecord::Base.logger.level = Logger::INFO

      class << ActiveRecord::Base.connection
        alias_method :old_columns, :columns unless instance_methods.include?("old_columns")
        alias_method :old_extensions, :extensions unless instance_methods.include?("old_extensions")

        def columns(*args)
          old_columns(*args).sort_by(&:name)
        end

        def extensions(*args)
          old_extensions(*args).sort
        end
      end
    end
  end
end
