class AddWantDirectDepositToNavigator < ActiveRecord::Migration[5.2]
  def change
    add_column :navigators, :want_direct_deposit, :boolean, default: false
  end
end
