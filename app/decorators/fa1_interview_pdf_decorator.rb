class Fa1InterviewPdfDecorator < SimpleDelegator
  def attributes
    {
      fa_name: fee_agent_name,
      fa_email: fee_agent_email,
      fa_number: fee_agent_phone_number,
      applicant_name: client_name,
      applicant_last_four_ssn: client_last_four_ssn,
      interview_attendees: attendee_names,
      food_stamps: checkbox_value(selected_snap),
      medicaid: checkbox_value(selected_medicaid),
      general_relief: checkbox_value(selected_general_relief),
      alaska_temporary_assistance: checkbox_value(selected_atap),
      adult_public_assistance: checkbox_value(selected_apa),
      cama: checkbox_value(selected_cama),
      explained_rights_and_responsibilities: yes_no_value(explained_rights),
      provided_rights_and_responsibilities: yes_no_value(explained_rights),
      any_not_listed: yes_no_enum(any_not_listed),
      any_not_listed_names: any_not_listed_names,
      any_away_from_home: yes_no_enum(any_away_from_home),
      any_away_from_home_reasons: any_away_from_home_names,
      any_drug_felony: yes_no_enum(anyone_convicted_drug_felony),
      any_drug_felony_name: convicted_drug_felony_name,
      served_parole: yes_no_enum(completed_probation_or_parole),
      mandatory_drug_treatment: yes_no_enum(completed_treatment_program),
      action_towards_rehabilitation: yes_no_enum(taken_action_towards_rehabilitation),
      re_entry_compliance: yes_no_enum(complied_with_reentry),
      when_alaska_arrival: arrival_in_alaska,
      stay_in_alaska: intend_to_stay,
      explain_expenses_payment: expenses_payment_details,
      tribal_member: yes_no_enum(anyone_tribe),
      tribal_member_name: tribe_details,
      any_hhm_work_stopped: yes_no_enum(anyone_stopped_work),
      hhm_work_stopped_name_and_reason: stopped_work_details,
      alaska_quest_card: yes_no_enum(has_quest_card),
      filing_federal_tax_return: yes_no_enum(anyone_filing_tax_return),
      who_is_filing_and_dependents: filing_tax_return_details,
      cama_medical_need: cama_details,
      other_information: other_info,
      client_sign_and_date: yes_no_value(client_sign_and_date),
      fa_sign_and_date: yes_no_value(fa_sign_and_date),
      all_hhm_ssn_listed: yes_no_value(all_ssns_included),
    }
  end

  def fee_agent_phone_number
    if super
      "#{super[0..2]}-#{super[3..5]}-#{super[6..9]}"
    end
  end

  private

  def yes_no_enum(value)
    value == "unfilled" ? "Off" : value
  end

  def yes_no_value(boolean)
    boolean ? "yes" : "no"
  end

  def checkbox_value(boolean)
    boolean ? "On" : "Off"
  end
end
