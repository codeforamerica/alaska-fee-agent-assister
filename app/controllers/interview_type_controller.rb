class InterviewTypeController < FormsController
  # def self.show_rule_sets(interview)
  #   super << ShowRules.must_have_supported_county(interview)
  # end
  layout "signpost"
  skip_before_action :ensure_interview
end