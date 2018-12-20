class ApprovedForDisabilityController < YesNoFormsController
  def self.show_rule_sets(interview)
    super << interview.selected_apa?
  end

  def yes_no_method_name
    :approved_for_disability
  end
end
