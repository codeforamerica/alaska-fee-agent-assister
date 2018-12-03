class AnyNotListedForm < Form
  set_attributes_for :interview, :any_not_listed

  validates :any_not_listed, inclusion: {
    in: %w(yes no),
    message: "Please answer this question",
  }

  def save
    interview.update(attributes_for(:interview))
  end
end
