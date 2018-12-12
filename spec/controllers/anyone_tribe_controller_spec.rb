require "rails_helper"

RSpec.describe AnyoneTribeController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    anyone_tribe: "yes",
  }
  it_behaves_like "form controller unsuccessful update"
  it_behaves_like "form controller always shows"
end
