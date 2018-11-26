require "rails_helper"

describe Fa1InterviewPdfDecorator do
  describe "attributes" do
    it "returns the hash of keys and values for the fillable FA1 pdf" do
      interview = create(:interview,
                         fee_agent_name: "Jane FA",
                         client_name: "Jessie Tester",
                         fee_agent_email: "jane_fa@example.com",
                         fee_agent_phone_number: "1234567890",
                         client_last_four_ssn: "1234",
                         attendee_names: "Jessie Tester and Jamie Tester")

      attributes = Fa1InterviewPdfDecorator.new(interview).attributes

      expect(attributes[:fa_name]).to eq "Jane FA"
      expect(attributes[:fa_email]).to eq "jane_fa@example.com"
      expect(attributes[:fa_number]).to eq "123-456-7890"
      expect(attributes[:applicant_name]).to eq "Jessie Tester"
      expect(attributes[:applicant_last_four_ssn]).to eq "1234"
      expect(attributes[:interview_attendees]).to eq "Jessie Tester and Jamie Tester"
    end
  end
end
