class ResidencyForm < Form
  set_attributes_for :interview, :arrival_in_alaska, :intend_to_stay
  set_attributes_for :navigator, :lived_outside_alaska

  validates_presence_of :lived_outside_alaska, message: "Make sure to select an answer"
  validate :arrival_in_alaska_validation
  validates_presence_of :intend_to_stay, message: "Make sure to select an answer"

  def save
    interview.update(attributes_for(:interview))
    interview.navigator.update(attributes_for(:navigator))
  end

  def self.existing_attributes(interview)
    HashWithIndifferentAccess.new(interview.attributes.merge(interview.navigator.attributes))
  end

  def arrival_in_alaska_validation
    if lived_outside_alaska == "yes" && arrival_in_alaska.blank?
      errors.add(:arrival_in_alaska, "Make sure to include an answer")
    end
  end
end
