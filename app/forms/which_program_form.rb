class WhichProgramForm < Form
  set_attributes_for :interview, :selected_snap, :selected_medicaid, :selected_general_relief,
                     :selected_atap, :selected_apa, :selected_cama

  validate :at_least_one_program_selected

  def save
    interview.update(attributes_for(:interview))
  end

  def self.existing_attributes(interview)
    attributes_to_checkbox_values(interview)
  end

  private

  def at_least_one_program_selected
    return true if attributes_for(:interview).values.any? { |program| program == "1" }

    errors.add(:program_type, "Make sure to select at least one program.")
  end
end
