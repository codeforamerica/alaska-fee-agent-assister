require "rails_helper"

RSpec.describe WhichProgramForm do
  describe "validations" do
    context "when at least one program is true" do
      it "is valid" do
        form = WhichProgramForm.new(
          nil,
          selected_snap: "1",
          selected_medicaid: "0",
          selected_general_relief: "0",
          selected_atap: "0",
          selected_apa: "0",
          selected_cama: "0",
        )

        expect(form).to be_valid
      end
    end

    context "when all programs are false" do
      it "is invalid" do
        form = WhichProgramForm.new(
          nil,
          selected_snap: "0",
          selected_medicaid: "0",
          selected_general_relief: "0",
          selected_atap: "0",
          selected_apa: "0",
          selected_cama: "0",
        )

        expect(form).not_to be_valid
        expect(form.errors[:program_type]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        selected_snap: "1",
        selected_medicaid: "1",
        selected_general_relief: "1",
        selected_atap: "0",
        selected_apa: "0",
        selected_cama: "0",
      }
    end

    it "persists the values to the correct models" do
      form = WhichProgramForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.selected_snap).to be(true)
      expect(interview.selected_medicaid).to be(true)
      expect(interview.selected_general_relief).to be(true)
      expect(interview.selected_atap).to be(false)
      expect(interview.selected_apa).to be(false)
      expect(interview.selected_cama).to be(false)
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview,
                         selected_snap: true,
                         selected_medicaid: true,
                         selected_general_relief: true,
                         selected_atap: false,
                         selected_apa: false,
                         selected_cama: false)

      form = WhichProgramForm.from_interview(interview)

      expect(form.selected_snap).to eq("1")
      expect(form.selected_medicaid).to eq("1")
      expect(form.selected_general_relief).to eq("1")
      expect(form.selected_atap).to eq("0")
      expect(form.selected_apa).to eq("0")
      expect(form.selected_cama).to eq("0")
    end
  end
end
