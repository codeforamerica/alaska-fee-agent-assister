class FilingTaxReturnDetailsController < FormsController
  layout "left_aligned"
  def self.show_rule_sets(interview)
    super << interview.anyone_filing_tax_return_yes?
  end
end
