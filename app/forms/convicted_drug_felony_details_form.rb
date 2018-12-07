class ConvictedDrugFelonyDetailsForm < Form
  set_attributes_for :interview,
                     :convicted_drug_felony_name,
                     :completed_probation_or_parole,
                     :completed_treatment_program,
                     :taken_action_towards_rehabilitation,
                     :complied_with_reentry

  validates_presence_of :convicted_drug_felony_name, message: "Make sure to include their name."

  def save
    enum_keys = %i[
      completed_probation_or_parole
      completed_treatment_program
      taken_action_towards_rehabilitation
      complied_with_reentry
    ]
    enum_values = attributes_for(:interview).slice(*enum_keys)
    enum_values.update(enum_values) { |_, val| val == "yes" ? "yes" : "no" }
    interview.update(enum_values.merge(attributes_for(:interview).except(*enum_keys)))
  end
end
