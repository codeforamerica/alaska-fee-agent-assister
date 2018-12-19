require "rails_helper"

RSpec.describe CitizenForm do
  describe "validations" do
    context "when citizen is provided" do
      it "is valid" do
        form = CitizenForm.new(
          nil,
          citizen: "yes",
        )

        expect(form).to be_valid
      end
    end

    context "when citizen is not provided" do
      it "is invalid" do
        form = CitizenForm.new(
          nil,
          citizen: nil,
        )

        expect(form).not_to be_valid
        expect(form.errors[:citizen]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview, :with_navigator }

    let(:valid_params) do
      {
        citizen: "yes",
      }
    end

    it "persists the values to the correct models" do
      form = CitizenForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.navigator.citizen).to eq "yes"
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, navigator: build(:navigator, citizen: "yes"))

      form = CitizenForm.from_interview(interview)

      expect(form.citizen).to eq "yes"
    end
  end
end
