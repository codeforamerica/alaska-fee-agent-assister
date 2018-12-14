class ExpensesPaymentDetailsForm < Form
  set_attributes_for :interview, :expenses_payment_details

  validates_presence_of :expenses_payment_details, message: "Make sure to include an answer."

  def save
    interview.update(attributes_for(:interview))
  end
end
