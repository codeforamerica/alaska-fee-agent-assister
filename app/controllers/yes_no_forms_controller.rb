class YesNoFormsController < FormsController
  layout "yes_no"

  helper_method :yes_no_method_name, :yes_value, :no_value

  def yes_value
    "yes"
  end

  def no_value
    "no"
  end
end
