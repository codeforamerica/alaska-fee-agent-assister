require "rails_helper"

RSpec.describe RightsAndResponsibilitiesForm do
  describe "validations" do
    context "when rights_and_responsibilities is provided" do
      it "is valid" do
        form = RightsAndResponsibilitiesForm.new(
          nil,
          explained_rights: "1",
        )

        expect(form).to be_valid
      end
    end

    context "when rights_and_responsibilities is false" do
      it "is invalid" do
        form = RightsAndResponsibilitiesForm.new(
          nil,
          explained_rights: "0",
        )

        expect(form).not_to be_valid
        expect(form.errors[:explained_rights]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        explained_rights: "1",
      }
    end

    it "persists the values to the correct models" do
      form = RightsAndResponsibilitiesForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.explained_rights).to be(true)
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, :with_navigator)

      form = RightsAndResponsibilitiesForm.from_interview(interview)

      expect(form.explained_rights).to eq("0")
    end
  end
end
