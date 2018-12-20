class ParentNotInHomeController < YesNoFormsController
  def self.show_rule_sets(interview)
    super << interview.navigator.children_in_home?
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
