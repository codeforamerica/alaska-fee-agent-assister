class AddStoppedWorkToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :anyone_stopped_work, :integer, default: 0
    add_column :interviews, :stopped_work_details, :text
  end
end
