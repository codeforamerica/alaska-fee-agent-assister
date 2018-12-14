require "rails_helper"

RSpec.describe FilingTaxReturnDetailsForm do
  describe "validations" do
    context "when filing_tax_return_details is provided" do
      it "is valid" do
        form = FilingTaxReturnDetailsForm.new(
          nil,
          filing_tax_return_details: "a bunch of details",
        )

        expect(form).to be_valid
      end
    end

    context "when filing_tax_return_details is not provided" do
      it "is invalid" do
        form = FilingTaxReturnDetailsForm.new(
          nil,
          filing_tax_return_details: nil,
        )

        expect(form).not_to be_valid
        expect(form.errors[:filing_tax_return_details]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        filing_tax_return_details: "YES YES YES",
      }
    end

    it "persists the values to the correct models" do
      form = FilingTaxReturnDetailsForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.filing_tax_return_details).to eq "YES YES YES"
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, filing_tax_return_details: "OKAY OKAY OKAY")

      form = FilingTaxReturnDetailsForm.from_interview(interview)

      expect(form.filing_tax_return_details).to eq "OKAY OKAY OKAY"
    end
  end
end
