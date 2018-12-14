require "rails_helper"

RSpec.describe ExpensesPaymentDetailsController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    expenses_payment_details: "supporting details",
  }
  it_behaves_like "form controller unsuccessful update"
  it_behaves_like "form controller always shows"
end
