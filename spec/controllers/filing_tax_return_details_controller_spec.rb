require "rails_helper"

RSpec.describe FilingTaxReturnDetailsController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    filing_tax_return_details: "value",
  }
  it_behaves_like "form controller unsuccessful update"

  describe "#show?" do
    context "when someone in household is filing_tax_return" do
      it "returns true" do
        application = create(:interview, anyone_filing_tax_return: "yes")

        show = FilingTaxReturnDetailsController.show?(application)
        expect(show).to eq(true)
      end
    end

    context "when no one in household is filing_tax_return" do
      it "returns false" do
        application = create(:interview, anyone_filing_tax_return: "no")

        skip_step = FilingTaxReturnDetailsController.show?(application)
        expect(skip_step).to eq(false)
      end
    end
  end
end
