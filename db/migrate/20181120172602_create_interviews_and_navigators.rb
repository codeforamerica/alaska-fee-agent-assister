class CreateInterviewsAndNavigators < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews, &:timestamps

    create_table :navigators do |t|
      t.references :interview
      t.integer :interview_type
      t.timestamps
    end

    change_column_default :navigators, :interview_type, from: nil, to: 0
  end
end
