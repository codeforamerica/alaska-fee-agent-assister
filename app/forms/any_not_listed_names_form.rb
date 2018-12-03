class AnyNotListedNamesForm < Form
  set_attributes_for :interview, :any_not_listed_names

  validates_presence_of :any_not_listed_names, message: "Make sure to include an answer."

  def save
    interview.update(attributes_for(:interview))
  end
end
