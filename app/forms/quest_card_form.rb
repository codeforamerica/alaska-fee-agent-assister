class QuestCardForm < Form
  set_attributes_for :interview, :has_quest_card

  validates :has_quest_card, inclusion: {
    in: %w(yes no),
    message: "Make sure to select yes or no.",
  }

  def save
    interview.update(attributes_for(:interview))
  end
end
