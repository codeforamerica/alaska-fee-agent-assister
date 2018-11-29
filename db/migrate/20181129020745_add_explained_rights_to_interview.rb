class AddExplainedRightsToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :explained_rights, :boolean, default: false
  end
end
