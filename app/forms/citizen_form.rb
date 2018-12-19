class CitizenForm < Form
  set_attributes_for :navigator, :citizen

  validates_inclusion_of :citizen, { in: %w{yes no}, message: "Make sure to choose an option." }

  def save
    interview.navigator.update(attributes_for(:navigator))
  end

  def self.existing_attributes(interview)
    HashWithIndifferentAccess.new(interview.attributes.merge(interview.navigator.attributes))
  end
end
