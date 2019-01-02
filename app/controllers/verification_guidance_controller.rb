class VerificationGuidanceController < FormsController
  layout "signpost"

  def edit
    @interview = VerificationGuidanceInterviewDecorator.new(current_interview)
  end

  def form_class
    NullForm
  end
end
