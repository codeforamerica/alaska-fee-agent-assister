require "rails_helper"

RSpec.describe AnyAwayFromHomeNamesForm do
  describe "validations" do
    context "when any_away_from_home_names is provided" do
      it "is valid" do
        form = AnyAwayFromHomeNamesForm.new(
          nil,
          any_away_from_home_names: "best attribute",
        )

        expect(form).to be_valid
      end
    end

    context "when any_away_from_home_names is not provided" do
      it "is invalid" do
        form = AnyAwayFromHomeNamesForm.new(
          nil,
          any_away_from_home_names: nil,
        )

        expect(form).not_to be_valid
        expect(form.errors[:any_away_from_home_names]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        any_away_from_home_names: "Lupe Fiasco, Black Thought, Andre 3000, Jay Z, Biggie",
      }
    end

    it "persists the values to the correct models" do
      form = AnyAwayFromHomeNamesForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.any_away_from_home_names).to eq "Lupe Fiasco, Black Thought, Andre 3000, Jay Z, Biggie"
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create :interview, any_away_from_home_names: "Black Thought"

      form = AnyAwayFromHomeNamesForm.from_interview(interview)

      expect(form.any_away_from_home_names).to eq "Black Thought"
    end
  end
end
