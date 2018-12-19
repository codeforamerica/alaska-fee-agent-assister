class ChildrenInHomeController < YesNoFormsController
  def self.show_rule_sets(interview)
    [
      interview.navigator.interview_type_application?,
      (interview.selected_medicaid || interview.selected_atap),
    ] + super
  end

  def yes_no_method_name
    :children_in_home
  end

  def yes_value
    true
  end

  def no_value
    false
  end
end
