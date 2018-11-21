require "rails_helper"

RSpec.describe FeeAgentDetailsForm do
  describe "validations" do
    context "when all fee agent fields are provided" do
      it "is valid" do
        form = FeeAgentDetailsForm.new(
          nil,
          fee_agent_name: "Fee M. Agent",
          fee_agent_email: "feeagent@example.com",
          fee_agent_phone_number: "555-555-5555",
        )

        expect(form).to be_valid
      end
    end

    context "when fee_agent_name is not provided" do
      it "is invalid" do
        form = FeeAgentDetailsForm.new(
          nil,
          fee_agent_name: "",
          fee_agent_email: "feeagent@example.com",
          fee_agent_phone_number: "555-555-5555",
        )

        expect(form).not_to be_valid
        expect(form.errors[:fee_agent_name]).to be_present
      end
    end

    context "when fee_agent_email is not provided" do
      it "is invalid" do
        form = FeeAgentDetailsForm.new(
          nil,
          fee_agent_name: "Fee M. Agent",
          fee_agent_email: "",
          fee_agent_phone_number: "555-555-5555",
        )

        expect(form).not_to be_valid
        expect(form.errors[:fee_agent_email]).to be_present
      end
    end

    context "when fee_agent_email is an incorrect format" do
      it "is invalid" do
        form = FeeAgentDetailsForm.new(
          nil,
            fee_agent_name: "Fee M. Agent",
            fee_agent_email: "asdflkasdfj",
            fee_agent_phone_number: "555-555-5555",
          )

        expect(form).not_to be_valid
        expect(form.errors[:fee_agent_email]).to be_present
      end
    end

    context "when fee_agent_phone_number is not provided" do
      it "is invalid" do
        form = FeeAgentDetailsForm.new(
          nil,
          fee_agent_name: "Fee M. Agent",
          fee_agent_email: "feeagent@example.com",
          fee_agent_phone_number: "",
        )

        expect(form).not_to be_valid
        expect(form.errors[:fee_agent_phone_number]).to be_present
      end
    end

    context "when fee_agent_phone_number is an incorrect format" do
      it "is invalid" do
        form = FeeAgentDetailsForm.new(
          nil,
          fee_agent_name: "Fee M. Agent",
          fee_agent_email: "feeagent@example.com",
          fee_agent_phone_number: "asdfasf",
        )

        expect(form).not_to be_valid
        expect(form.errors[:fee_agent_phone_number]).to be_present
      end
    end
  end

  describe "#save" do
    let(:valid_params) do
      {
        fee_agent_name: "Fee M. Agent",
        fee_agent_email: "feeagent@example.com",
        fee_agent_phone_number: "555-555-5555",
      }
    end

    it "persists the values to the correct models and strips dashes from phone" do
      interview = create(:interview)

      form = FeeAgentDetailsForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.fee_agent_name).to eq("Fee M. Agent")
      expect(interview.fee_agent_email).to eq("feeagent@example.com")
      expect(interview.fee_agent_phone_number).to eq("5555555555")
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview,
                         :with_navigator,
                         fee_agent_name: "Fee M. Agent",
                         fee_agent_email: "feeagent@example.com",
                         fee_agent_phone_number: "5555555555")

      form = FeeAgentDetailsForm.from_interview(interview)

      expect(form.fee_agent_name).to eq("Fee M. Agent")
      expect(form.fee_agent_email).to eq("feeagent@example.com")
      expect(form.fee_agent_phone_number).to eq("5555555555")
    end
  end
end
