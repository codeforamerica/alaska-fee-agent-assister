class Fa1InterviewPdfDecorator < SimpleDelegator
  def attributes
    {
      fa_name: fee_agent_name,
      fa_email: fee_agent_email,
      fa_number: fee_agent_phone_number,
      applicant_name: client_name,
      applicant_last_four_ssn: client_last_four_ssn,
      interview_attendees: attendee_names,
    }
  end

  def fee_agent_phone_number
    if super
      "#{super[0..2]}-#{super[3..5]}-#{super[6..9]}"
    end
  end
end
