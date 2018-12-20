class PregnantController < YesNoFormsController
  def self.show_rule_sets(interview)
    super << interview.selected_atap?
  end

  def yes_no_method_name
    :pregnant
  end
end
