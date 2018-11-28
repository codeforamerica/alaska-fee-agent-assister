require "rails_helper"

describe Fa1InterviewPdfDecorator do
  describe "attributes" do
    it "only includes keys available in PDF" do
      attributes = Fa1InterviewPdfDecorator.new(create(:interview)).attributes

      valid_attributes = PdfForms::PdftkWrapper.new.get_field_names("app/lib/pdfs/FA1.pdf")

      expect(valid_attributes).to include(*attributes.keys.map(&:to_s))
    end

    it "includes valid values for checkboxes" do
      attributes = Fa1InterviewPdfDecorator.new(
        create(:interview,
               selected_snap: true,
               selected_medicaid: true,
               selected_general_relief: true,
               selected_atap: false,
               selected_apa: false,
               selected_cama: false),
      ).attributes

      fields = PdfForms::PdftkWrapper.new.get_fields("app/lib/pdfs/FA1.pdf")

      checkbox_fields = %i[
        food_stamps
        medicaid
        general_relief
        alaska_temporary_assistance
        adult_public_assistance
        cama
      ]
      checkbox_fields.each do |checkbox_field|
        valid_options = fields.detect { |field| field.name == checkbox_field.to_s }.options
        expect(valid_options).to include(attributes[checkbox_field])
      end
    end

    it "returns the hash of keys and values for the fillable FA1 pdf" do
      interview = create(:interview,
                         fee_agent_name: "Jane FA",
                         client_name: "Jessie Tester",
                         fee_agent_email: "jane_fa@example.com",
                         fee_agent_phone_number: "1234567890",
                         client_last_four_ssn: "1234",
                         attendee_names: "Jessie Tester and Jamie Tester",
                         selected_snap: true,
                         selected_medicaid: true,
                         selected_general_relief: true,
                         selected_atap: false,
                         selected_apa: false,
                         selected_cama: false)

      attributes = Fa1InterviewPdfDecorator.new(interview).attributes

      expect(attributes[:fa_name]).to eq "Jane FA"
      expect(attributes[:fa_email]).to eq "jane_fa@example.com"
      expect(attributes[:fa_number]).to eq "123-456-7890"
      expect(attributes[:applicant_name]).to eq "Jessie Tester"
      expect(attributes[:applicant_last_four_ssn]).to eq "1234"
      expect(attributes[:interview_attendees]).to eq "Jessie Tester and Jamie Tester"
      expect(attributes[:food_stamps]).to eq "On"
      expect(attributes[:medicaid]).to eq "On"
      expect(attributes[:general_relief]).to eq "On"
      expect(attributes[:alaska_temporary_assistance]).to eq "Off"
      expect(attributes[:adult_public_assistance]).to eq "Off"
      expect(attributes[:cama]).to eq "Off"
    end
  end
end
