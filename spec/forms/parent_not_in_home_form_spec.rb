require "rails_helper"

RSpec.describe ParentNotInHomeForm do
  describe "#save" do
    let(:interview) { create :interview, :with_navigator }

    let(:valid_params) do
      {
        parent_not_in_home: "true",
      }
    end

    it "persists the values to the correct models" do
      form = ParentNotInHomeForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.navigator.parent_not_in_home).to eq true
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, navigator: build(:navigator, parent_not_in_home: true))

      form = ParentNotInHomeForm.from_interview(interview)

      expect(form.parent_not_in_home).to eq true
    end
  end
end
