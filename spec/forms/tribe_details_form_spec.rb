require "rails_helper"

RSpec.describe TribeDetailsForm do
  describe "validations" do
    context "when tribe_details is provided" do
      it "is valid" do
        form = TribeDetailsForm.new(
          nil,
          tribe_details: "best attribute",
        )

        expect(form).to be_valid
      end
    end

    context "when tribe_details is not provided" do
      it "is invalid" do
        form = TribeDetailsForm.new(
          nil,
          tribe_details: nil,
        )

        expect(form).not_to be_valid
        expect(form.errors[:tribe_details]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        tribe_details: "WHATEVER THOUGH",
      }
    end

    it "persists the values to the correct models" do
      form = TribeDetailsForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.tribe_details).to eq "WHATEVER THOUGH"
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, tribe_details: "SOMETHING SOMETHING")

      form = TribeDetailsForm.from_interview(interview)

      expect(form.tribe_details).to eq "SOMETHING SOMETHING"
    end
  end
end
