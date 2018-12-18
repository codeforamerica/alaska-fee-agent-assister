class AddLivingExpensesToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :has_rent_mortgage_expense, :boolean, default: false
    add_column :interviews, :has_space_rent_expense, :boolean, default: false
    add_column :interviews, :has_property_tax_expense, :boolean, default: false
    add_column :interviews, :has_child_support_expense, :boolean, default: false
    add_column :interviews, :has_home_insurance_expense, :boolean, default: false
    add_column :interviews, :has_child_care_expense, :boolean, default: false
    add_column :interviews, :has_medical_care_medicine_expense, :boolean, default: false
    add_column :interviews, :has_wood_coal_expense, :boolean, default: false
    add_column :interviews, :has_telephone_expense, :boolean, default: false
    add_column :interviews, :has_water_sewage_expense, :boolean, default: false
    add_column :interviews, :has_electricity_expense, :boolean, default: false
    add_column :interviews, :has_propane_gas_expense, :boolean, default: false
    add_column :interviews, :has_oil_expense, :boolean, default: false
  end
end
