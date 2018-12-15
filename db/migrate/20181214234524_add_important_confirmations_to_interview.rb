class AddImportantConfirmationsToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :client_sign_and_date, :boolean
    add_column :interviews, :fa_sign_and_date, :boolean
    add_column :interviews, :all_ssns_included, :boolean
  end
end
