require "rails_helper"

RSpec.describe InterviewTypeForm do
  describe "validations" do
    context "when valid interview_type is provided" do
      it "is valid" do
        form = InterviewTypeForm.new(
          nil,
          interview_type: "application",
        )

        expect(form).to be_valid
      end
    end

    context "when interview_type is not a valid type" do
      it "is invalid" do
        form = InterviewTypeForm.new(
          nil,
          interview_type: "boop",
        )

        expect(form).not_to be_valid
        expect(form.errors[:interview_type]).to be_present
      end
    end

    context "when interview_type is not provided" do
      it "is invalid" do
        form = InterviewTypeForm.new(
          nil,
            interview_type: "",
          )

        expect(form).not_to be_valid
        expect(form.errors[:interview_type]).to be_present
      end
    end
  end

  describe "#save" do
    let(:valid_params) do
      {
        interview_type: "renewal",
      }
    end

    it "persists the values to the correct models" do
      interview = create(:interview, :with_navigator)
      form = InterviewTypeForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.navigator.interview_type).to eq("renewal")
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, :with_navigator, interview_type: "renewal")

      form = InterviewTypeForm.from_interview(interview)

      expect(form.interview_type).to eq("renewal")
    end
  end
end
