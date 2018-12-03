require "rails_helper"

RSpec.describe AnyNotListedNamesController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    any_not_listed_names: "Best E. Person",
  }
  it_behaves_like "form controller unsuccessful update"

  describe "show?" do
    it "shows when there is someone who lives in the house that is not included" do
      interview = create :interview, any_not_listed: "yes"

      show_form = described_class.show? interview

      expect(show_form).to eq(true)
    end
  end
end
