require "rails_helper"

RSpec.describe ImportantConfirmationsForm do
  describe "validations" do
    context "all confirmations are provided" do
      it "is valid" do
        form = ImportantConfirmationsForm.new(
          nil,
          client_sign_and_date: "1",
          fa_sign_and_date: "1",
          all_ssns_included: "1",
        )

        expect(form).to be_valid
      end
    end

    context "a confirmation is missing" do
      it "is invalid" do
        form = ImportantConfirmationsForm.new(
          nil,
          client_sign_and_date: "1",
          fa_sign_and_date: "1",
          all_ssns_included: "0",
        )

        expect(form).not_to be_valid
        expect(form.errors[:all_ssns_included]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        client_sign_and_date: true,
        fa_sign_and_date: true,
        all_ssns_included: true,
      }
    end

    it "persists the values to the correct models" do
      form = ImportantConfirmationsForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.client_sign_and_date).to be_truthy
      expect(interview.fa_sign_and_date).to be_truthy
      expect(interview.all_ssns_included).to be_truthy
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview,
        client_sign_and_date: true,
        fa_sign_and_date: true,
        all_ssns_included: true)

      form = ImportantConfirmationsForm.from_interview(interview)

      expect(form.client_sign_and_date).to be_truthy
      expect(form.fa_sign_and_date).to be_truthy
      expect(form.all_ssns_included).to be_truthy
    end
  end
end
