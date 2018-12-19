class AddCitizenToNavigator < ActiveRecord::Migration[5.2]
  def change
    add_column :navigators, :citizen, :integer, default: 0
  end
end
