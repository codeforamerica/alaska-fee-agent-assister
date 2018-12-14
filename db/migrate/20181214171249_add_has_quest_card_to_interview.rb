class AddHasQuestCardToInterview < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :has_quest_card, :integer, default: 0
  end
end
