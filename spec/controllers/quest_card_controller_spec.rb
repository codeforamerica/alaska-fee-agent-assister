require "rails_helper"

RSpec.describe QuestCardController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    has_quest_card: "yes",
  }
  it_behaves_like "form controller unsuccessful update"
  it_behaves_like "form controller always shows"
end
