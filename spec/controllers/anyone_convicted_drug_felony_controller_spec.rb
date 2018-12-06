require "rails_helper"

RSpec.describe AnyoneConvictedDrugFelonyController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    anyone_convicted_drug_felony: "yes",
  }
  it_behaves_like "form controller unsuccessful update"
  it_behaves_like "form controller always shows"
end
