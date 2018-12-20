require "rails_helper"

RSpec.describe ApprovedForDisabilityForm do
  describe "validations" do
    context "when approved_for_disability is provided" do
      it "is valid" do
        form = ApprovedForDisabilityForm.new(
          nil,
          approved_for_disability: "yes",
        )

        expect(form).to be_valid
      end
    end

    context "when approved_for_disability is not provided" do
      it "is invalid" do
        form = ApprovedForDisabilityForm.new(
          nil,
          approved_for_disability: nil,
        )

        expect(form).not_to be_valid
        expect(form.errors[:approved_for_disability]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        approved_for_disability: "yes",
      }
    end

    it "persists the values to the correct models" do
      form = ApprovedForDisabilityForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.approved_for_disability).to eq("yes")
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, approved_for_disability: "yes")

      form = ApprovedForDisabilityForm.from_interview(interview)

      expect(form.approved_for_disability).to eq("yes")
    end
  end
end
