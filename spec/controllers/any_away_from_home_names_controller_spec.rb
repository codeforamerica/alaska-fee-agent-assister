require "rails_helper"

RSpec.describe AnyAwayFromHomeNamesController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    any_away_from_home_names: "Best E. Person",
  }
  it_behaves_like "form controller unsuccessful update"

  describe "show?" do
    it "shows when there is someone who is away from home" do
      interview = create :interview, any_away_from_home: "yes"

      show_form = described_class.show? interview

      expect(show_form).to eq(true)
    end
  end
end
