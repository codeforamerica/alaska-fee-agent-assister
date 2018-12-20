require "rails_helper"

RSpec.describe CitizenForm do
  describe "#save" do
    let(:interview) { create :interview, :with_navigator }

    let(:valid_params) do
      {
        citizen: "true",
      }
    end

    it "persists the values to the correct models" do
      form = CitizenForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.navigator.citizen).to eq true
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, navigator: build(:navigator, citizen: true))

      form = CitizenForm.from_interview(interview)

      expect(form.citizen).to eq true
    end
  end
end
