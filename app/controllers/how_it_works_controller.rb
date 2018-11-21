class HowItWorksController < FormsController
  layout "signpost"

  def form_class
    NullForm
  end
end
