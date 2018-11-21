require "rails_helper"

RSpec.describe FeeAgentDetailsController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    fee_agent_name: "Best E. Person",
    fee_agent_email: "feeagent@example.com",
    fee_agent_phone_number: "555-555-5555",
  }
  it_behaves_like "form controller unsuccessful update"
  it_behaves_like "form controller always shows"
end
