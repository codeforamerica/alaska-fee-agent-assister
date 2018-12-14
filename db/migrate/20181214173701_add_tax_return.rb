class AddTaxReturn < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :anyone_filing_tax_return, :integer, default: 0
    add_column :interviews, :filing_tax_return_details, :text
  end
end
