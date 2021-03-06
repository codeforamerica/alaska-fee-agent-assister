require "rails_helper"

RSpec.describe AnyNotListedController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    any_not_listed: "yes",
  }
  it_behaves_like "form controller unsuccessful update"
  it_behaves_like "form controller always shows"
end
