class AddPregnantToNavigator < ActiveRecord::Migration[5.2]
  def change
    add_column :navigators, :pregnant, :boolean, default: false
  end
end
