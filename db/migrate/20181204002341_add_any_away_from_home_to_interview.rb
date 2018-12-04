class AddAnyAwayFromHomeToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :any_away_from_home, :integer, default: 0
  end
end
