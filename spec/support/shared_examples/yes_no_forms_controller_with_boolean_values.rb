require "rails_helper"

RSpec.shared_examples_for "yes no forms controller with boolean values" do
  describe "yes_value" do
    it "returns 'true'" do
      expect(controller.yes_value).to eq(true)
    end
  end

  describe "no_value" do
    it "returns 'false'" do
      expect(controller.no_value).to eq(false)
    end
  end
end
