class AddAnyNotListedToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :any_not_listed, :integer, default: 0
  end
end
