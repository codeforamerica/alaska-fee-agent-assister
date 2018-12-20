class ApprovedForDisabilityForm < Form
  set_attributes_for :interview, :approved_for_disability

  validates_inclusion_of :approved_for_disability, { in: %w{yes no}, message: "Make sure to choose an option." }

  def save
    interview.update(attributes_for(:interview))
  end
end
