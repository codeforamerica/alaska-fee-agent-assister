require "rails_helper"

RSpec.describe QuestCardForm do
  describe "validations" do
    context "when has_quest_card is provided" do
      it "is valid" do
        form = QuestCardForm.new(
          nil,
          has_quest_card: "yes",
        )

        expect(form).to be_valid
      end
    end

    context "when has_quest_card is not provided" do
      it "is invalid" do
        form = QuestCardForm.new(
          nil,
          has_quest_card: nil,
        )

        expect(form).not_to be_valid
        expect(form.errors[:has_quest_card]).to be_present
      end
    end

    context "when has_quest_card is not a valid value" do
      it "is invalid" do
        form = QuestCardForm.new(
          nil,
          has_quest_card: "asdfas",
        )

        expect(form).not_to be_valid
        expect(form.errors[:has_quest_card]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        has_quest_card: "yes",
      }
    end

    it "persists the values to the correct models" do
      form = QuestCardForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.has_quest_card_yes?).to be(true)
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, has_quest_card: "yes")

      form = QuestCardForm.from_interview(interview)

      expect(form.has_quest_card).to eq("yes")
    end
  end
end
