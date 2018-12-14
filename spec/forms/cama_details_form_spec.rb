require "rails_helper"

RSpec.describe CamaDetailsForm do
  describe "validations" do
    context "when cama_details is provided" do
      it "is valid" do
        form = CamaDetailsForm.new(
          nil,
          cama_details: "best attribute",
        )

        expect(form).to be_valid
      end
    end

    context "when some_attribute is not provided" do
      it "is still valid" do
        form = CamaDetailsForm.new(
          nil,
          cama_details: nil,
        )

        expect(form).to be_valid
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        cama_details: "Lots of medical problems to report.",
      }
    end

    it "persists the values to the correct models" do
      form = CamaDetailsForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.cama_details).to eq "Lots of medical problems to report."
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, cama_details: "SOMETHING")

      form = CamaDetailsForm.from_interview(interview)

      expect(form.cama_details).to eq "SOMETHING"
    end
  end
end
