require "rails_helper"

RSpec.describe ShowRules do
  describe ".defaults_to_true" do
    it "always returns true" do
      expect(ShowRules.defaults_to_true).to be true
    end
  end
end
