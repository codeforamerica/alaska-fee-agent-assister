class InterimAssistanceController < YesNoFormsController
  def self.show_rule_sets(interview)
    super << interview.approved_for_disability_no?
  end

  def yes_no_method_name
    :interim_assistance
  end

  def yes_value
    true
  end

  def no_value
    false
  end
end
