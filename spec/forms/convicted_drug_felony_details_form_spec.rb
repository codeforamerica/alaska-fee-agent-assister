require "rails_helper"

RSpec.describe ConvictedDrugFelonyDetailsForm do
  describe "validations" do
    context "when name is provided and at least one checkbox is checked" do
      it "is valid" do
        form = ConvictedDrugFelonyDetailsForm.new(
          nil,
          convicted_drug_felony_name: "Anne Doe",
          completed_probation_or_parole: "1",
          completed_treatment_program: "0",
          taken_action_towards_rehabilitation: "0",
          complied_with_reentry: "0",
          none: "0",
        )

        expect(form).to be_valid
      end
    end

    context "when convicted_drug_felony_name is not provided but a checkbox is checked" do
      it "is invalid" do
        form = ConvictedDrugFelonyDetailsForm.new(
          nil,
          convicted_drug_felony_name: "",
          completed_probation_or_parole: "1",
          completed_treatment_program: "0",
          taken_action_towards_rehabilitation: "0",
          complied_with_reentry: "0",
          none: "0",
        )

        expect(form).not_to be_valid
        expect(form.errors[:convicted_drug_felony_name]).to be_present
      end
    end

    context "when convicted_drug_felony_name is provided but a checkbox is not checked" do
      it "is invalid" do
        form = ConvictedDrugFelonyDetailsForm.new(
          nil,
          convicted_drug_felony_name: "Anne Doe",
          completed_probation_or_parole: "0",
          completed_treatment_program: "0",
          taken_action_towards_rehabilitation: "0",
          complied_with_reentry: "0",
          none: "0",
        )

        expect(form).not_to be_valid
        expect(form.errors[:convicted_drug_felony_details]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        convicted_drug_felony_name: "Anne Doe",
        completed_probation_or_parole: "1",
        completed_treatment_program: "1",
        taken_action_towards_rehabilitation: "0",
        complied_with_reentry: "0",
        none: "0",
      }
    end

    it "persists the values to the correct models and fills in no for unprovided enums" do
      form = ConvictedDrugFelonyDetailsForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.convicted_drug_felony_name).to eq("Anne Doe")
      expect(interview.completed_probation_or_parole).to eq("yes")
      expect(interview.completed_treatment_program).to eq("yes")
      expect(interview.taken_action_towards_rehabilitation).to eq("no")
      expect(interview.complied_with_reentry).to eq("no")
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview,
                         convicted_drug_felony_name: "Anne Dog",
                         completed_probation_or_parole: "yes",
                         completed_treatment_program: "yes",
                         taken_action_towards_rehabilitation: "yes",
                         complied_with_reentry: "yes")

      form = ConvictedDrugFelonyDetailsForm.from_interview(interview)

      expect(form.convicted_drug_felony_name).to eq("Anne Dog")
      expect(form.completed_probation_or_parole).to eq("yes")
      expect(form.completed_treatment_program).to eq("yes")
      expect(form.taken_action_towards_rehabilitation).to eq("yes")
      expect(form.complied_with_reentry).to eq("yes")
    end
  end
end
