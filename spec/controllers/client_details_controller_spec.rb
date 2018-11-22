require "rails_helper"

RSpec.describe ClientDetailsController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    client_name: "Best E. Person",
    client_last_four_ssn: "1234",
    attendee_names: "Anne Dog, Best E. Person",
  }
  it_behaves_like "form controller unsuccessful update"
  it_behaves_like "form controller always shows"
end
