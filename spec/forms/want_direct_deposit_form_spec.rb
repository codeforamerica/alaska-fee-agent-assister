require "rails_helper"

RSpec.describe WantDirectDepositForm do
  describe "validations" do
    context "when want_direct_deposit is provided" do
      it "is valid" do
        form = WantDirectDepositForm.new(
          nil,
          want_direct_deposit: false,
        )

        expect(form).to be_valid
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview, :with_navigator }

    let(:valid_params) do
      {
        want_direct_deposit: true,
      }
    end

    it "persists the values to the correct models" do
      form = WantDirectDepositForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.navigator.want_direct_deposit).to be_truthy
    end
  end
end
