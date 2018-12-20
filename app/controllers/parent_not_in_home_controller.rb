class ParentNotInHomeController < YesNoFormsController
  def self.show_rule_sets(interview)
    [
      interview.navigator.interview_type_application?,
      (interview.selected_medicaid || interview.selected_atap),
      interview.navigator.children_in_home?,
    ] + super
  end

  def yes_no_method_name
    :parent_not_in_home
  end

  def yes_value
    true
  end

  def no_value
    false
  end
end
