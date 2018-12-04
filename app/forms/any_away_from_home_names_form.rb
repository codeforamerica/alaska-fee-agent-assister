class AnyAwayFromHomeNamesForm < Form
  set_attributes_for :interview, :any_away_from_home_names

  validates_presence_of :any_away_from_home_names, message: "Make sure to include an answer."

  def save
    interview.update(attributes_for(:interview))
  end
end
