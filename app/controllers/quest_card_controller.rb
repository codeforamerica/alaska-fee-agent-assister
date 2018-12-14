class QuestCardController < FormsController
  layout "yes_no"

  helper_method :yes_no_method_name

  def yes_no_method_name
    :has_quest_card
  end
end
