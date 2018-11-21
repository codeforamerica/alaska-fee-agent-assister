class AddFeeAgentFieldsToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :fee_agent_name, :string
    add_column :interviews, :fee_agent_email, :string
    add_column :interviews, :fee_agent_phone_number, :string
  end
end
