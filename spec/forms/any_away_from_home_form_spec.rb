require "rails_helper"

RSpec.describe AnyAwayFromHomeForm do
  describe "validations" do
    context "when any_away_from_home is provided" do
      it "is valid" do
        form = AnyAwayFromHomeForm.new(
          nil,
          any_away_from_home: "no",
        )

        expect(form).to be_valid
      end
    end

    context "when some_attribute is not provided" do
      it "is invalid" do
        form = AnyAwayFromHomeForm.new(
          nil,
          any_away_from_home: nil,
        )

        expect(form).not_to be_valid
        expect(form.errors[:any_away_from_home]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        any_away_from_home: "yes",
      }
    end

    it "persists the values to the correct models" do
      form = AnyAwayFromHomeForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.any_away_from_home).to eq "yes"
    end
  end
end
