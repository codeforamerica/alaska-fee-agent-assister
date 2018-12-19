class AddChildrenInHomeToNavigator < ActiveRecord::Migration[5.2]
  def change
    add_column :navigators, :children_in_home, :boolean, default: false
  end
end
