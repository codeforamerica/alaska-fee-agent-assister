class ConvictedDrugFelonyDetailsController < FormsController
  layout "left_aligned"
  # Specify under what conditions controller should be accessible:
  # (By default it will always be shown
  def self.show_rule_sets(interview)
    super << interview.anyone_convicted_drug_felony_yes?
  end
end
