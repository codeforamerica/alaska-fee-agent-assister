class WhatLivingExpensesForm < Form
  set_attributes_for :interview,
                     :has_rent_mortgage_expense,
                     :has_space_rent_expense,
                     :has_property_tax_expense,
                     :has_child_support_expense,
                     :has_home_insurance_expense,
                     :has_child_care_expense,
                     :has_medical_care_medicine_expense,
                     :has_wood_coal_expense,
                     :has_telephone_expense,
                     :has_water_sewage_expense,
                     :has_electricity_expense,
                     :has_propane_gas_expense,
                     :has_oil_expense,
                     :none

  validate :at_least_one_expense_or_none_selected

  def save
    interview.update(attributes_for(:interview).except(:none))
  end

  def self.existing_attributes(interview)
    attributes_to_checkbox_values(interview, attribute_names.reject { |name| name == :none })
  end

  private

  def at_least_one_expense_or_none_selected
    return true if attributes_for(:interview).values.any? { |value| value == "1" }

    errors.add(:living_expenses, "Please select at least one option or 'none of the above.'")
  end
end
