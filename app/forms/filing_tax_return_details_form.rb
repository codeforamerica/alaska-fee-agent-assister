class FilingTaxReturnDetailsForm < Form
  set_attributes_for :interview, :filing_tax_return_details

  validates_presence_of :filing_tax_return_details, message: "Make sure to include an answer."

  def save
    interview.update(attributes_for(:interview))
  end
end
