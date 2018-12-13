require "rails_helper"

RSpec.describe StoppedWorkDetailsForm do
  describe "validations" do
    context "when stopped_work_details is provided" do
      it "is valid" do
        form = StoppedWorkDetailsForm.new(
          nil,
          stopped_work_details: "Travelling circus act is closed for the winter.",
        )

        expect(form).to be_valid
      end
    end

    context "when stopped_work_details is not provided" do
      it "is invalid" do
        form = StoppedWorkDetailsForm.new(
          nil,
          stopped_work_details: nil,
        )

        expect(form).not_to be_valid
        expect(form.errors[:stopped_work_details]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        stopped_work_details: "Laser tattoo removal only opened weekends now.",
      }
    end

    it "persists the values to the correct models" do
      form = StoppedWorkDetailsForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.stopped_work_details).to eq "Laser tattoo removal only opened weekends now."
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, stopped_work_details: "OKAY OKAY")

      form = StoppedWorkDetailsForm.from_interview(interview)

      expect(form.stopped_work_details).to eq "OKAY OKAY"
    end
  end
end
