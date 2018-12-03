require "rails_helper"

RSpec.describe AnyNotListedForm do
  describe "validations" do
    context "when any_not_listed is provided" do
      it "is valid" do
        form = AnyNotListedForm.new(
          nil,
          any_not_listed: "yes",
        )

        expect(form).to be_valid
      end
    end

    context "when any_not_listed is not provided" do
      it "is invalid" do
        form = AnyNotListedForm.new(
          nil,
          any_not_listed: nil,
        )

        expect(form).not_to be_valid
        expect(form.errors[:any_not_listed]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        any_not_listed: "yes",
      }
    end

    it "persists the values to the correct models" do
      form = AnyNotListedForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.any_not_listed).to eq "yes"
    end
  end
end
