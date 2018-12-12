class TribeDetailsForm < Form
  set_attributes_for :interview, :tribe_details

  validates_presence_of :tribe_details, message: "Make sure to include an answer."

  def save
    interview.update(attributes_for(:interview))
  end
end
