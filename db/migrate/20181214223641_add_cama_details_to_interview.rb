class AddCamaDetailsToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :cama_details, :text
  end
end
