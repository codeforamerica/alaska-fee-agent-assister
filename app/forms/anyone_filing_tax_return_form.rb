class AnyoneFilingTaxReturnForm < Form
  set_attributes_for :interview, :anyone_filing_tax_return

  validates_inclusion_of :anyone_filing_tax_return, { in: %w{yes no}, message: "Make sure to choose an option." }

  def save
    interview.update(attributes_for(:interview))
  end
end
