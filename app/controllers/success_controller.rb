class SuccessController < FormsController
  layout "confirmation"

  def form_class
    NullForm
  end

  def next_path
    root_path
  end
end
