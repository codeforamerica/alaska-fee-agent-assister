require "rails_helper"

RSpec.shared_examples_for "yes no forms controller with enum values" do
  describe "yes_value" do
    it "returns 'yes'" do
      expect(controller.yes_value).to eq("yes")
    end
  end

  describe "no_value" do
    it "returns 'no'" do
      expect(controller.no_value).to eq("no")
    end
  end
end
