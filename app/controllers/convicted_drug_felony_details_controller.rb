class ConvictedDrugFelonyDetailsController < FormsController
  layout "left_aligned"

  def self.show_rule_sets(interview)
    super << interview.anyone_convicted_drug_felony_yes?
  end
end
