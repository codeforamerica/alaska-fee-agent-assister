class CamaDetailsController < FormsController
  layout "left_aligned"

  def self.show_rule_sets(interview)
    super << interview.selected_cama?
  end
end
