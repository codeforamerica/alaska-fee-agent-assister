class AttachDocumentsSignpostController < FormsController
  layout "signpost"

  def form_class
    NullForm
  end
end
