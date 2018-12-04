class AddAnyAwayFromHomeNamesToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :any_away_from_home_names, :text
  end
end
