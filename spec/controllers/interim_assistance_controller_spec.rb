require "rails_helper"

RSpec.describe InterimAssistanceController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    interim_assistance: true,
  }
  it_behaves_like "yes no forms controller with boolean values"

  describe "#show?" do
    context "when applicant is approved for disability" do
      it "returns false" do
        application = create(:interview, approved_for_disability: "yes")

        show = InterimAssistanceController.show?(application)
        expect(show).to eq(false)
      end
    end

    context "when applicant is not approved for disability" do
      it "returns true" do
        application = create(:interview, approved_for_disability: "no")

        skip_step = InterimAssistanceController.show?(application)
        expect(skip_step).to eq(true)
      end
    end
  end
end
