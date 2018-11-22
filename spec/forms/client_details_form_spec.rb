require "rails_helper"

RSpec.describe ClientDetailsForm do
  describe "validations" do
    context "when all fields are provided" do
      it "is valid" do
        form = ClientDetailsForm.new(
          nil,
          client_name: "best person",
          client_last_four_ssn: "1234",
          attendee_names: "People",
        )

        expect(form).to be_valid
      end
    end

    context "when client_name is not provided" do
      it "is invalid" do
        form = ClientDetailsForm.new(
          nil,
          client_name: "",
          client_last_four_ssn: "1234",
          attendee_names: "People",
        )

        expect(form).not_to be_valid
        expect(form.errors[:client_name]).to be_present
      end
    end

    context "when client_last_four_ssn is not provided" do
      it "is invalid" do
        form = ClientDetailsForm.new(
          nil,
          client_name: "best person",
          client_last_four_ssn: "",
          attendee_names: "People",
        )

        expect(form).not_to be_valid
        expect(form.errors[:client_last_four_ssn]).to be_present
      end
    end

    context "when client_last_four_ssn is not four digits" do
      it "is invalid" do
        form_one = ClientDetailsForm.new(
          nil,
          client_name: "best person",
          client_last_four_ssn: "12345",
          attendee_names: "People",
        )

        form_two = ClientDetailsForm.new(
          nil,
          client_name: "best person",
          client_last_four_ssn: "123",
          attendee_names: "People",
        )

        expect(form_one).not_to be_valid
        expect(form_two).not_to be_valid
        expect(form_one.errors[:client_last_four_ssn]).to be_present
        expect(form_two.errors[:client_last_four_ssn]).to be_present
      end
    end

    context "when attendee_names is not provided" do
      it "is invalid" do
        form = ClientDetailsForm.new(
          nil,
          client_name: "best person",
          client_last_four_ssn: "1234",
          attendee_names: "",
        )

        expect(form).not_to be_valid
        expect(form.errors[:attendee_names]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        client_name: "best person",
        client_last_four_ssn: "1234",
        attendee_names: "best person and anne",
      }
    end

    it "persists the values to the correct models" do
      form = ClientDetailsForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.client_name).to eq("best person")
      expect(interview.client_last_four_ssn).to eq("1234")
      expect(interview.attendee_names).to eq("best person and anne")
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview,
                         client_name: "best person",
                         client_last_four_ssn: "1234",
                         attendee_names: "best person and anne")

      form = ClientDetailsForm.from_interview(interview)

      expect(form.client_name).to eq("best person")
      expect(form.client_last_four_ssn).to eq("1234")
      expect(form.attendee_names).to eq("best person and anne")
    end
  end
end
