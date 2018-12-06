class AnyNotListedController < FormsController
  layout "yes_no"

  helper_method :yes_no_method_name

  def yes_no_method_name
    :any_not_listed
  end
end
