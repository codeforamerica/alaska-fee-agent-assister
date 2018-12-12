class TribeDetailsController < FormsController
  layout "left_aligned"
  def self.show_rule_sets(interview)
    super << interview.anyone_tribe_yes?
  end
end
