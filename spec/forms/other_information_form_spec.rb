require "rails_helper"

RSpec.describe OtherInformationForm do
  describe "validations" do
    context "when other_info is provided" do
      it "is valid" do
        form = OtherInformationForm.new(
          nil,
          other_info: "best attribute",
        )

        expect(form).to be_valid
      end
    end

    context "when other_info is not provided" do
      it "is still valid" do
        form = OtherInformationForm.new(
          nil,
          other_info: nil,
        )

        expect(form).to be_valid
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        other_info: "I'm hungry",
      }
    end

    it "persists the values to the correct models" do
      form = OtherInformationForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.other_info).to eq "I'm hungry"
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, other_info: "What up")

      form = OtherInformationForm.from_interview(interview)

      expect(form.other_info).to eq "What up"
    end
  end
end
