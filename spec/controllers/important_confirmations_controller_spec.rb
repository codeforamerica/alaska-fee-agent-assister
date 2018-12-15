require "rails_helper"

RSpec.describe ImportantConfirmationsController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    client_sign_and_date: "1",
    fa_sign_and_date: "1",
    all_ssns_included: "1",
  }
  it_behaves_like "form controller unsuccessful update"
  it_behaves_like "form controller always shows"
end
