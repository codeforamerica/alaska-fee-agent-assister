class ImportantConfirmationsForm < Form
  set_attributes_for :interview, :client_sign_and_date, :fa_sign_and_date, :all_ssns_included

  validation_message = "Make sure to do this so that the case can be properly processed."

  validates :client_sign_and_date, inclusion: {
    in: ["1"],
    message: validation_message,
  }
  validates :fa_sign_and_date, inclusion: {
    in: ["1"],
    message: validation_message,
  }
  validates :all_ssns_included, inclusion: {
    in: ["1"],
    message: validation_message,
  }

  def save
    interview.update(attributes_for(:interview))
  end
end
