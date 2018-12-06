require "rails_helper"

RSpec.describe AnyoneConvictedDrugFelonyForm do
  describe "validations" do
    context "when anyone_convicted_drug_felony is provided" do
      it "is valid" do
        form = AnyoneConvictedDrugFelonyForm.new(
          nil,
          anyone_convicted_drug_felony: "yes",
        )

        expect(form).to be_valid
      end
    end

    context "when anyone_convicted_drug_felony is not provided" do
      it "is invalid" do
        form = AnyoneConvictedDrugFelonyForm.new(
          nil,
          anyone_convicted_drug_felony: "unfilled",
        )

        expect(form).not_to be_valid
        expect(form.errors[:anyone_convicted_drug_felony]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        anyone_convicted_drug_felony: "yes",
      }
    end

    it "persists the values to the correct models" do
      form = AnyoneConvictedDrugFelonyForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(form.anyone_convicted_drug_felony).to eq("yes")
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, anyone_convicted_drug_felony: "no")

      form = AnyoneConvictedDrugFelonyForm.from_interview(interview)

      expect(form.anyone_convicted_drug_felony).to eq("no")
    end
  end
end
