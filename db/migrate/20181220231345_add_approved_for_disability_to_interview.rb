class AddApprovedForDisabilityToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :approved_for_disability, :integer, default: 0
  end
end
