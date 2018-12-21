class AddInterimAssistanceToNavigator < ActiveRecord::Migration[5.2]
  def change
    add_column :navigators, :interim_assistance, :boolean, default: false
  end
end
