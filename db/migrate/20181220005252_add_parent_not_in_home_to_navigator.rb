class AddParentNotInHomeToNavigator < ActiveRecord::Migration[5.2]
  def change
    add_column :navigators, :parent_not_in_home, :boolean, default: false
  end
end
