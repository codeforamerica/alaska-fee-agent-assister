class ChangeCitizenColumnType < ActiveRecord::Migration[5.2]
  def change
    remove_column :navigators, :citizen, :integer, default: 0
    add_column :navigators, :citizen, :boolean, default: false
  end
end
