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
      any_not_listed: any_not_listed,
    }
  end

  def fee_agent_phone_number
    if super
      "#{super[0..2]}-#{super[3..5]}-#{super[6..9]}"
    end
  end

  private

  def yes_no_value(boolean)
    boolean ? "yes" : "no"
  end

  def checkbox_value(boolean)
    boolean ? "On" : "Off"
  end
end
