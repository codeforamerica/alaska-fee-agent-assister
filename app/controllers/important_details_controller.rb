class ImportantDetailsController < FormsController
  layout "signpost"
  skip_before_action :ensure_interview

  def form_class
    NullForm
  end

  def next_path
    root_path
  end
end
