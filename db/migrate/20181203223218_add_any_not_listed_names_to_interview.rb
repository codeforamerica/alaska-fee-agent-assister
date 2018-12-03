class AddAnyNotListedNamesToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :any_not_listed_names, :text
  end
end
