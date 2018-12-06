class AnyoneConvictedDrugFelonyController < FormsController
  layout "yes_no"

  helper_method :yes_no_method_name

  def yes_no_method_name
    :anyone_convicted_drug_felony
  end
end
