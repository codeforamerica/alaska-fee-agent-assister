require "rails_helper"

RSpec.describe RightsAndResponsibilitiesController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    explained_rights: "1",
  }
  it_behaves_like "form controller unsuccessful update"
  it_behaves_like "form controller always shows"
end
