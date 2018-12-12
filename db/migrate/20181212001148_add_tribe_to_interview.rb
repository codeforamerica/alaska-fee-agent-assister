class AddTribeToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :anyone_tribe, :integer, default: 0
    add_column :interviews, :tribe_details, :text
  end
end
