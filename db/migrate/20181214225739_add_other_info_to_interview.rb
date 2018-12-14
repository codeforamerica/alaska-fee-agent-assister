class AddOtherInfoToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :other_info, :text
  end
end
