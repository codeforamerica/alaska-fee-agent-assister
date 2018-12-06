class AnyoneConvictedDrugFelonyForm < Form
  set_attributes_for :interview, :anyone_convicted_drug_felony

  validates_inclusion_of :anyone_convicted_drug_felony, {in: %w{yes no}, message: "Make sure to choose an option." }

  def save
    interview.update(attributes_for(:interview))
  end
end
