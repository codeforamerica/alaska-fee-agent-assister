class InterviewTypeForm < Form
  set_attributes_for :navigator, :interview_type

  validates :interview_type, inclusion: {
    in: %w(application renewal),
    message: "Please select a valid type",
  }

  def save
    unless interview.present?
      self.interview = Interview.create
      interview.create_navigator
    end

    interview.navigator.update(attributes_for(:navigator))
  end

  def self.existing_attributes(interview)
    if interview.present?
      HashWithIndifferentAccess.new(interview.navigator.attributes)
    else
      {}
    end
  end
end
