class AddExpensesPaymentDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :expenses_payment_details, :string
  end
end
