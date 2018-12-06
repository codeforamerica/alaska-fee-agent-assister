class AddAnyoneConvictedDrugFelonyToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :anyone_convicted_drug_felony, :integer, default: 0
  end
end
