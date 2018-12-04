class AnyAwayFromHomeForm < Form
  set_attributes_for :interview, :any_away_from_home

  validates :any_away_from_home, inclusion: {
    in: %w(yes no),
    message: "Please answer this question",
  }

  def save
    interview.update(attributes_for(:interview))
  end
end
