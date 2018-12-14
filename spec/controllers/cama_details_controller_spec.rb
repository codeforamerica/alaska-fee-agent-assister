require "rails_helper"

RSpec.describe CamaDetailsController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    cama_details: "Best E. Person",
  }
  it_behaves_like "form controller always shows"
end
