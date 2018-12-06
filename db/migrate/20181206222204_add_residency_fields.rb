class AddResidencyFields < ActiveRecord::Migration[5.2]
  def change
    add_column :navigators, :lived_outside_alaska, :integer, default: 0
    add_column :interviews, :arrival_in_alaska, :string
    add_column :interviews, :intend_to_stay, :integer, default: 0
  end
end
