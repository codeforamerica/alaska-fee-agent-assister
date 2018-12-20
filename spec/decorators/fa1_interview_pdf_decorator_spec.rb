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
          has_rent_mortgage_expense: true,
          has_space_rent_expense: true,
          has_property_tax_expense: false,
          has_child_support_expense: false,
          has_home_insurance_expense: false,
          has_child_care_expense: false,
          has_medical_care_medicine_expense: false,
          has_wood_coal_expense: false,
          has_telephone_expense: false,
          has_water_sewage_expense: false,
          has_electricity_expense: false,
          has_propane_gas_expense: false,
          has_oil_expense: false,
          any_away_from_home: "no",
          anyone_convicted_drug_felony: "yes",
          completed_probation_or_parole: "yes",
          completed_treatment_program: "yes",
          taken_action_towards_rehabilitation: "yes",
          complied_with_reentry: "yes",
          anyone_tribe: "yes",
          anyone_stopped_work: "yes",
          has_quest_card: "yes",
          anyone_filing_tax_return: "yes",
          client_sign_and_date: true,
          fa_sign_and_date: true,
          all_ssns_included: true),
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
        tribal_member
        any_hhm_work_stopped
        alaska_quest_card
        filing_federal_tax_return
        client_sign_and_date
        fa_sign_and_date
        all_hhm_ssn_listed
        rent_mortgage
        space_rent
        property_tax
        child_support
        home_insurance
        child_care
        medical_care_medicine
        wood_coal
        telephone
        water_sewer
        electricity
        propane_gas
        oil
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
        created_at: "01/01/2000 15:00:00",
        client_last_four_ssn: "1234",
        attendee_names: "Jessie Tester and Jamie Tester",
        selected_snap: true,
        selected_medicaid: true,
        selected_general_relief: true,
        selected_atap: false,
        selected_apa: false,
        selected_cama: false,
        has_rent_mortgage_expense: true,
        has_space_rent_expense: true,
        has_property_tax_expense: false,
        has_child_support_expense: false,
        has_home_insurance_expense: false,
        has_child_care_expense: false,
        has_medical_care_medicine_expense: false,
        has_wood_coal_expense: false,
        has_telephone_expense: false,
        has_water_sewage_expense: false,
        has_electricity_expense: false,
        has_propane_gas_expense: false,
        has_oil_expense: false,
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
        expenses_payment_details: "explanation",
        anyone_tribe: "yes",
        tribe_details: "more tribe details",
        anyone_stopped_work: "yes",
        stopped_work_details: "stopped work name",
        has_quest_card: "yes",
        anyone_filing_tax_return: "yes",
        filing_tax_return_details: "tax return details",
        cama_details: "cama details",
        other_info: "other info",
        client_sign_and_date: true,
        fa_sign_and_date: true,
        all_ssns_included: true)

      attributes = Fa1InterviewPdfDecorator.new(interview).attributes

      expect(attributes[:fa_name]).to eq "Jane FA"
      expect(attributes[:fa_email]).to eq "jane_fa@example.com"
      expect(attributes[:fa_number]).to eq "123-456-7890"
      expect(attributes[:interview_date]).to eq "01/01/2000"
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
      expect(attributes[:tribal_member]).to eq "yes"
      expect(attributes[:any_hhm_work_stopped]).to eq "yes"
      expect(attributes[:tribal_member_name]).to eq "more tribe details"
      expect(attributes[:hhm_work_stopped_name_and_reason]).to eq "stopped work name"
      expect(attributes[:alaska_quest_card]).to eq "yes"
      expect(attributes[:filing_federal_tax_return]).to eq "yes"
      expect(attributes[:who_is_filing_and_dependents]).to eq "tax return details"
      expect(attributes[:cama_medical_need]).to eq "cama details"
      expect(attributes[:other_information]).to eq "other info"
      expect(attributes[:client_sign_and_date]).to eq "yes"
      expect(attributes[:fa_sign_and_date]).to eq "yes"
      expect(attributes[:all_hhm_ssn_listed]).to eq "yes"
      expect(attributes[:rent_mortgage]).to eq "On"
      expect(attributes[:space_rent]).to eq "On"
      expect(attributes[:property_tax]).to eq "Off"
      expect(attributes[:child_support]).to eq "Off"
      expect(attributes[:home_insurance]).to eq "Off"
      expect(attributes[:child_care]).to eq "Off"
      expect(attributes[:medical_care_medicine]).to eq "Off"
      expect(attributes[:wood_coal]).to eq "Off"
      expect(attributes[:telephone]).to eq "Off"
      expect(attributes[:water_sewer]).to eq "Off"
      expect(attributes[:electricity]).to eq "Off"
      expect(attributes[:propane_gas]).to eq "Off"
      expect(attributes[:oil]).to eq "Off"
    end

    it "fills in both explained and provided for rights and responsibilities" do
      interview = create(:interview, explained_rights: true)

      attributes = Fa1InterviewPdfDecorator.new(interview).attributes

      expect(attributes[:explained_rights_and_responsibilities]).to eq("yes")
      expect(attributes[:provided_rights_and_responsibilities]).to eq("yes")
    end
  end
end
