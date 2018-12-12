require "rails_helper"

RSpec.describe TribeDetailsController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    tribe_details: "yes",
  }
  it_behaves_like "form controller unsuccessful update"

  describe "#show?" do
    context "when someone in household is tribe" do
      it "returns true" do
        application = create(:interview, anyone_tribe: "yes")

        show = TribeDetailsController.show?(application)
        expect(show).to eq(true)
      end
    end

    context "when no one in household is tribe" do
      it "returns false" do
        application = create(:interview, anyone_tribe: "no")

        skip_step = TribeDetailsController.show?(application)
        expect(skip_step).to eq(false)
      end
    end
  end
end
