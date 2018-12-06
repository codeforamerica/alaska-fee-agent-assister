require "rails_helper"

RSpec.describe ConvictedDrugFelonyDetailsForm do
  describe "validations" do
    context "when some_attribute is provided" do
      it "is valid" do
        form = ConvictedDrugFelonyDetailsForm.new(
          nil,
          some_attribute: "best attribute",
        )

        expect(form).to be_valid
      end
    end

    context "when some_attribute is not provided" do
      it "is invalid" do
        form = ConvictedDrugFelonyDetailsForm.new(
          nil,
          some_attribute: nil,
        )

        expect(form).not_to be_valid
        expect(form.errors[:some_attribute]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        # some attributes
      }
    end

    it "persists the values to the correct models" do
      form = ConvictedDrugFelonyDetailsForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      # expectations
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      # interview = create(:interview, :with_navigator)

      # form = ConvictedDrugFelonyDetailsForm.from_interview(interview)

      # expectation
    end
  end
end
