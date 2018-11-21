class InterviewTypeController < FormsController
  layout "signpost"

  skip_before_action :ensure_interview

  def update_session
    session[:current_interview_id] = @form.interview.id
  end
end
