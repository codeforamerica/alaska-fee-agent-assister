class AnyAwayFromHomeNamesController < FormsController
  layout "left_aligned"

  def self.show_rule_sets(interview)
    super << interview.any_away_from_home_yes?
  end
end
