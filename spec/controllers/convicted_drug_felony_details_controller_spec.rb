require "rails_helper"

RSpec.describe ConvictedDrugFelonyDetailsController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    convicted_drug_felony_name: "Anne Dog",
    completed_probation_or_parole: "1",
  }
  it_behaves_like "form controller unsuccessful update"

  describe "#show?" do
    context "when someone in household is convicted_drug_felony" do
      it "returns true" do
        application = create(:interview, anyone_convicted_drug_felony: "yes")

        show = ConvictedDrugFelonyDetailsController.show?(application)
        expect(show).to eq(true)
      end
    end

    context "when no one in household is convicted_drug_felony" do
      it "returns false" do
        application = create(:interview, anyone_convicted_drug_felony: "no")

        show = ConvictedDrugFelonyDetailsController.show?(application)
        expect(show).to eq(false)
      end
    end
  end
end
