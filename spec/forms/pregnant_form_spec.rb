require "rails_helper"

RSpec.describe PregnantForm do
  describe "#save" do
    let(:interview) { create :interview, :with_navigator }

    let(:valid_params) do
      {
        pregnant: "true",
      }
    end

    it "persists the values to the correct models" do
      form = PregnantForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.navigator.pregnant).to eq(true)
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, navigator: build(:navigator, pregnant: true))

      form = PregnantForm.from_interview(interview)

      expect(form.pregnant).to eq(true)
    end
  end
end
