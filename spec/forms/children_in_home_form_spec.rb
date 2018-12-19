require "rails_helper"

RSpec.describe ChildrenInHomeForm do
  describe "#save" do
    let(:interview) { create :interview, :with_navigator }

    let(:valid_params) do
      {
        children_in_home: "true",
      }
    end

    it "persists the values to the correct models" do
      form = ChildrenInHomeForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.navigator.children_in_home).to eq true
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, navigator: build(:navigator, children_in_home: true))

      form = ChildrenInHomeForm.from_interview(interview)

      expect(form.children_in_home).to eq true
    end
  end
end
