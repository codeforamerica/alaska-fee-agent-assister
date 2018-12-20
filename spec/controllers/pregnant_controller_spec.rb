require "rails_helper"

RSpec.describe PregnantController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    pregnant: true,
  }
  it_behaves_like "yes no forms controller with boolean values"

  describe "#show?" do
    context "when applicant is applying for Alaska Temporary Assistance" do
      it "returns true" do
        application = create(:interview, :with_navigator, selected_atap: true)

        show = PregnantController.show?(application)
        expect(show).to eq(true)
      end
    end

    context "when applicant is not applying for Alaska Temporary Assistance" do
      it "returns false" do
        application = create(:interview, selected_atap: false)

        skip_step = PregnantController.show?(application)
        expect(skip_step).to eq(false)
      end
    end
  end
end
