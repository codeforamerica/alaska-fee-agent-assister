class ConvictedDrugFelonyDetailsForm < Form
  set_attributes_for :interview,
                     :convicted_drug_felony_name,
                     :completed_probation_or_parole,
                     :completed_treatment_program,
                     :taken_action_towards_rehabilitation,
                     :complied_with_reentry,
                     :none

  validates_presence_of :convicted_drug_felony_name, message: "Make sure to include their name."
  validate :at_least_one_drug_felony_or_none_selected

  def save
    enum_keys = %i[
      completed_probation_or_parole
      completed_treatment_program
      taken_action_towards_rehabilitation
      complied_with_reentry
    ]
    enum_values = attributes_for(:interview).slice(*enum_keys)
    enum_values.update(enum_values) { |_, val| val == "1" ? "yes" : "no" }
    interview.update(enum_values.merge(attributes_for(:interview).except(*enum_keys).except(:none)))
  end

  private

  def at_least_one_drug_felony_or_none_selected
    return true if attributes_for(:interview).except(:convicted_drug_felony_name).values.any? { |value| value == "1" }

    errors.add(:convicted_drug_felony_details, "Please select at least one option or 'none of the above.'")
  end
end
