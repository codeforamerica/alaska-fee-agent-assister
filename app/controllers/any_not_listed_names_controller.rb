class AnyNotListedNamesController < FormsController
  layout "left_aligned"

  def self.show_rule_sets(interview)
    super << interview.any_not_listed_yes?
  end
end
