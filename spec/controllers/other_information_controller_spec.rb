require "rails_helper"

RSpec.describe OtherInformationController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    other_info: "Best E. Person",
  }
  it_behaves_like "form controller always shows"
end
