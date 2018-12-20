require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#format_phone_number" do
    context "phone number present" do
      it "formats a phone number" do
        expect(helper.format_phone_number("2024561111")).to eq("(202) 456-1111")
      end
    end

    context "blank value" do
      it "returns nil" do
        expect(helper.format_phone_number("")).to be_nil
      end
    end
  end
end
