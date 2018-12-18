require "rails_helper"

RSpec.describe WhatLivingExpensesController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    has_rent_mortgage_expense: "1",
  }
  it_behaves_like "form controller always shows"
end
