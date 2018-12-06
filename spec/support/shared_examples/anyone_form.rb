require "rails_helper"

RSpec.shared_examples_for "anyone form" do |method_name|
  describe "validations" do
    context "when #{method_name} is provided" do
      it "is valid" do
        form = described_class.new(
          nil,
            method_name => "yes",
          )

        expect(form).to be_valid
      end
    end

    context "when #{method_name} is not provided" do
      it "is invalid" do
        form = described_class.new(
          nil,
            method_name => "unfilled",
          )

        expect(form).not_to be_valid
        expect(form.errors[method_name.to_sym]).to be_present
      end
    end
  end

  describe "#save" do
    let(:valid_params) do
      {
        method_name => "yes",
      }
    end

    it "persists the values to the correct models" do
      interview = create(:interview)
      form = described_class.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(form.public_send(method_name)).to eq("yes")
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, method_name => "no")

      form = described_class.from_interview(interview)

      expect(form.public_send(method_name)).to eq("no")
    end
  end
end
