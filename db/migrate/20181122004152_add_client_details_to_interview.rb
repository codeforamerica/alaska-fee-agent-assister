class AddClientDetailsToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :client_name, :string
    add_column :interviews, :encrypted_client_last_four_ssn, :string
    add_column :interviews, :encrypted_client_last_four_ssn_iv, :string
    add_column :interviews, :attendee_names, :text
  end
end
