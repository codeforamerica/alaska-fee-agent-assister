require "rails_helper"

RSpec.describe ExpensesPaymentDetailsForm do
  describe "validations" do
    context "when how_supporting_details is provided" do
      it "is valid" do
        form = ExpensesPaymentDetailsForm.new(
          nil,
          expenses_payment_details: "best attribute",
        )

        expect(form).to be_valid
      end
    end

    context "when expenses_payment_details is not provided" do
      it "is invalid" do
        form = ExpensesPaymentDetailsForm.new(
          nil,
          expenses_payment_details: nil,
        )

        expect(form).not_to be_valid
        expect(form.errors[:expenses_payment_details]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        expenses_payment_details: "my supporting details",
      }
    end

    it "persists the values to the correct models" do
      form = ExpensesPaymentDetailsForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.expenses_payment_details).to eq "my supporting details"
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, :with_navigator, expenses_payment_details: "my supporting details")

      form = ExpensesPaymentDetailsForm.from_interview(interview)

      expect(form.expenses_payment_details).to eq "my supporting details"
    end
  end
end
