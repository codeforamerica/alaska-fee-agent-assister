require "rails_helper"

RSpec.describe WhichProgramController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    selected_snap: "1",
    selected_medicaid: "1",
    selected_general_relief: "1",
    selected_atap: "0",
    selected_apa: "0",
    selected_cama: "0",
  }
  it_behaves_like "form controller unsuccessful update"
  it_behaves_like "form controller always shows"
end
