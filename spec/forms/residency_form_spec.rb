require "rails_helper"

RSpec.describe ResidencyForm do
  describe "validations" do
    context "when lived_outside_alaska is no" do
      it "arrival_in_alaska isn't required" do
        form = ResidencyForm.new(
          nil,
          lived_outside_alaska: "no",
          arrival_in_alaska: nil,
          intend_to_stay: "yes",
        )

        expect(form).to be_valid
      end
    end

    context "when lived_outside_alaska is yes" do
      it "is valid when present" do
        form = ResidencyForm.new(
          nil,
          lived_outside_alaska: "yes",
          arrival_in_alaska: "Last year",
          intend_to_stay: "yes",
        )

        expect(form).to be_valid
      end

      it "arrival_in_alaska is required if missing" do
        form = ResidencyForm.new(
          nil,
          lived_outside_alaska: "yes",
          arrival_in_alaska: nil,
          intend_to_stay: "yes",
        )

        expect(form).not_to be_valid
        expect(form.errors[:arrival_in_alaska]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview, :with_navigator }

    let(:valid_params) do
      {
        lived_outside_alaska: "no",
        arrival_in_alaska: nil,
        intend_to_stay: "yes",
      }
    end

    it "persists the values to the correct models" do
      form = ResidencyForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.navigator.lived_outside_alaska).to eq "no"
      expect(interview.arrival_in_alaska).to be_nil
      expect(interview.intend_to_stay).to eq "yes"
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview,
                         navigator: build(:navigator, lived_outside_alaska: "yes"),
                         arrival_in_alaska: "Five years ago",
                         intend_to_stay: "yes")

      form = ResidencyForm.from_interview(interview)

      expect(form.lived_outside_alaska).to eq "yes"
      expect(form.arrival_in_alaska).to eq "Five years ago"
      expect(form.intend_to_stay).to eq "yes"
    end
  end
end
