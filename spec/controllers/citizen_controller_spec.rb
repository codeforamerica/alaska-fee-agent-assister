require "rails_helper"

RSpec.describe CitizenController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    citizen: true,
  }
  it_behaves_like "form controller always shows"
  it_behaves_like "yes no forms controller with boolean values"
end
