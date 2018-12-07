class AddAnyoneConvictedDetailsToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :convicted_drug_felony_name, :string
    add_column :interviews, :completed_probation_or_parole, :integer, default: 0
    add_column :interviews, :completed_treatment_program, :integer, default: 0
    add_column :interviews, :taken_action_towards_rehabilitation, :integer, default: 0
    add_column :interviews, :complied_with_reentry, :integer, default: 0
  end
end
