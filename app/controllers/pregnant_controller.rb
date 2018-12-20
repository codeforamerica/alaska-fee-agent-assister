class PregnantController < YesNoFormsController
  def self.show_rule_sets(interview)
    super << interview.selected_atap?
  end

  def yes_no_method_name
    :pregnant
  end

  def yes_value
    true
  end

  def no_value
    false
  end
end
