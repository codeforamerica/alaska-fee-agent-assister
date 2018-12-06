require "rails_helper"

RSpec.describe ConvictedDrugFelonyDetailsController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    attribute: "value",
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

        skip_step = ConvictedDrugFelonyDetailsController.show?(application)
        expect(skip_step).to eq(false)
      end
    end
  end
end