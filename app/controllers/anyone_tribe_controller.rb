class AnyoneTribeController < FormsController
  layout "yes_no"

  helper_method :yes_no_method_name

  def yes_no_method_name
    :anyone_tribe
  end
end
