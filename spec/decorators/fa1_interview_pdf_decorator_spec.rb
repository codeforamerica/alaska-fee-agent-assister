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
               selected_cama: false,
               explained_rights: true,
               any_not_listed: "yes",
               any_away_from_home: "no",
               anyone_convicted_drug_felony: "yes",
               completed_probation_or_parole: "yes",
               completed_treatment_program: "yes",
               taken_action_towards_rehabilitation: "yes",
               complied_with_reentry: "yes"),
      ).attributes

      fields = PdfForms::PdftkWrapper.new.get_fields("app/lib/pdfs/FA1.pdf")

      checkbox_fields = %i[
        food_stamps
        medicaid
        general_relief
        alaska_temporary_assistance
        adult_public_assistance
        cama
        explained_rights_and_responsibilities
        provided_rights_and_responsibilities
        any_not_listed
        any_away_from_home
        any_drug_felony
        served_parole
        mandatory_drug_treatment
        action_towards_rehabilitation
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
                         selected_cama: false,
                         any_not_listed: "yes",
                         any_not_listed_names: "Sophie",
                         any_away_from_home: "yes",
                         any_away_from_home_names: "Frank",
                         anyone_convicted_drug_felony: "yes",
                         convicted_drug_felony_name: "Anne Dog",
                         completed_probation_or_parole: "no",
                         completed_treatment_program: "no",
                         taken_action_towards_rehabilitation: "no",
                         complied_with_reentry: "unfilled",
                         arrival_in_alaska: "",
                         intend_to_stay: "yes",
                         expenses_payment_details: "explanation")

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
      expect(attributes[:any_not_listed]).to eq "yes"
      expect(attributes[:any_not_listed_names]).to eq "Sophie"
      expect(attributes[:any_away_from_home]).to eq "yes"
      expect(attributes[:any_away_from_home_reasons]).to eq "Frank"
      expect(attributes[:any_drug_felony]).to eq "yes"
      expect(attributes[:any_drug_felony_name]).to eq "Anne Dog"
      expect(attributes[:served_parole]).to eq "no"
      expect(attributes[:mandatory_drug_treatment]).to eq "no"
      expect(attributes[:action_towards_rehabilitation]).to eq "no"
      expect(attributes[:re_entry_compliance]).to eq "Off"
      expect(attributes[:when_alaska_arrival]).to eq ""
      expect(attributes[:stay_in_alaska]).to eq "yes"
      expect(attributes[:explain_expenses_payment]).to eq "explanation"
    end

    it "fills in both explained and provided for rights and responsibilities" do
      interview = create(:interview, explained_rights: true)

      attributes = Fa1InterviewPdfDecorator.new(interview).attributes

      expect(attributes[:explained_rights_and_responsibilities]).to eq("yes")
      expect(attributes[:provided_rights_and_responsibilities]).to eq("yes")
    end
  end
end
