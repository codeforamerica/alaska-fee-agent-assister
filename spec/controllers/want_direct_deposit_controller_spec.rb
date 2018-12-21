require "rails_helper"

RSpec.describe WantDirectDepositController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    want_direct_deposit: true,
  }
  it_behaves_like "yes no forms controller with boolean values"

  describe "#show?" do
    context "when applicant is applying for Alaska Temporary Assistance" do
      it "returns true" do
        application = create(:interview, :with_navigator, selected_atap: true)

        show = WantDirectDepositController.show?(application)
        expect(show).to eq(true)
      end
    end

    context "when applicant is applying for Adult Public Assistance" do
      it "returns true" do
        application = create(:interview, :with_navigator, selected_apa: true)

        show = WantDirectDepositController.show?(application)
        expect(show).to eq(true)
      end
    end

    context "when applicant is not applying for Adult Public Assistance or Alaska Temporary Assistance" do
      it "returns false" do
        application = create(:interview, selected_apa: false, selected_atap: false)

        skip_step = WantDirectDepositController.show?(application)
        expect(skip_step).to eq(false)
      end
    end
  end
end
