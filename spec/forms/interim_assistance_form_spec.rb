require "rails_helper"

RSpec.describe InterimAssistanceForm do
  describe "validations" do
    context "when interim_assistance is provided" do
      it "is valid" do
        form = InterimAssistanceForm.new(
          nil,
          interim_assistance: true,
        )

        expect(form).to be_valid
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview, :with_navigator }

    let(:valid_params) do
      {
        interim_assistance: true,
      }
    end

    it "persists the values to the correct models" do
      form = InterimAssistanceForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.navigator.interim_assistance).to be_truthy
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, navigator: build(:navigator, interim_assistance: false))

      form = InterimAssistanceForm.from_interview(interview)

      expect(form.interim_assistance).to be_falsey
    end
  end
end
