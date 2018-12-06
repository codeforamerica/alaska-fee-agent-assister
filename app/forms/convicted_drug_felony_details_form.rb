class ConvictedDrugFelonyDetailsForm < Form
  # Whitelist top-level parameter names for Interview, e.g.
  #
  #   given params: { form: { living_situation: "stable_housing" } }
  #
  #   set_attributes_for :interview, :living_situation
  #
  # Delete the method if you aren't updating the Interview.
  set_attributes_for :interview, :attribute_name

  # Add any validations below. Be sure to include helpful error messages.
  validates_presence_of :attribute_name, message: "Validation error"

  def save
    interview.update(attributes_for(:interview))
  end
end
