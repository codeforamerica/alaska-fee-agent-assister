class FeeAgentDetailsForm < Form
  set_attributes_for :interview, :fee_agent_name, :fee_agent_email, :fee_agent_phone_number

  before_validation -> { strip_dashes(:fee_agent_phone_number) }

  validates_presence_of :fee_agent_name, message: "Make sure to include the fee agent's name."
  validates :fee_agent_phone_number, ten_digit_phone_number: true

  validates_presence_of :fee_agent_email, message: "Make sure to include the fee agent's email address."
  validates :fee_agent_email,
            allow_blank: true,
            format: {
              with: /\A\S+@\S+\.\S+\z/,
              message: "Make sure to enter a valid email address.",
            }

  def save
    interview.update(attributes_for(:interview))
  end
end
