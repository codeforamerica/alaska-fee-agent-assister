require "rails_helper"

RSpec.describe AnyAwayFromHomeController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    any_away_from_home: "no",
  }
  it_behaves_like "form controller unsuccessful update"
  it_behaves_like "form controller always shows"
end
