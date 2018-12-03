require "rails_helper"

RSpec.describe AnyNotListedNamesForm do
  describe "validations" do
    context "when any_not_listed_names is provided" do
      it "is valid" do
        form = AnyNotListedNamesForm.new(
          nil,
          any_not_listed_names: "yada yada",
        )

        expect(form).to be_valid
      end
    end

    context "when any_not_listed_names is not provided" do
      it "is invalid" do
        form = AnyNotListedNamesForm.new(
          nil,
          any_not_listed_names: nil,
        )

        expect(form).not_to be_valid
        expect(form.errors[:any_not_listed_names]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        any_not_listed_names: "Sean Carter",
      }
    end

    it "persists the values to the correct models" do
      form = AnyNotListedNamesForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.any_not_listed_names).to eq "Sean Carter"
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, any_not_listed_names: "Beyonce Knowles")

      form = AnyNotListedNamesForm.from_interview(interview)

      expect(form.any_not_listed_names).to eq "Beyonce Knowles"
    end
  end
end
