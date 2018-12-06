require "rails_helper"

RSpec.describe ResidencyController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    lived_outside_alaska: "yes",
    arrival_in_alaska: "Last year",
    intend_to_stay: "yes",
  }
  it_behaves_like "form controller unsuccessful update"
  it_behaves_like "form controller always shows"
end
