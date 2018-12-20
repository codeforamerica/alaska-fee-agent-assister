require "rails_helper"

RSpec.describe ApprovedForDisabilityController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    approved_for_disability: "yes",
  }
  it_behaves_like "yes no forms controller with enum values"

  describe "#show" do
    context "selected APA" do
      it "shows" do
        application = create(:interview, selected_apa: true)

        show = ApprovedForDisabilityController.show?(application)
        expect(show).to eq(true)
      end
    end

    context "did not select APA" do
      it "does not show" do
        application = create(:interview, selected_apa: false)

        show = ApprovedForDisabilityController.show?(application)
        expect(show).to eq(false)
      end
    end
  end
end
