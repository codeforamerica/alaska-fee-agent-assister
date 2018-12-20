class HowToTakePhotosController < FormsController
  layout "signpost"

  def form_class
    NullForm
  end

  def next_path
    root_path
  end
end
