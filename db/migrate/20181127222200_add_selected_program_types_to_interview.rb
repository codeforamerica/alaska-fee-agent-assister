class AddSelectedProgramTypesToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :selected_snap, :boolean, default: false
    add_column :interviews, :selected_medicaid, :boolean, default: false
    add_column :interviews, :selected_general_relief, :boolean, default: false
    add_column :interviews, :selected_atap, :boolean, default: false
    add_column :interviews, :selected_apa, :boolean, default: false
    add_column :interviews, :selected_cama, :boolean, default: false
  end
end
