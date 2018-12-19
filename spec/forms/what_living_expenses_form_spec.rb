require "rails_helper"

RSpec.describe WhatLivingExpensesForm do
  describe "validations" do
    context "when at least one expense (or none of the above) is true" do
      it "is valid" do
        form = WhatLivingExpensesForm.new(
          nil,
          has_rent_mortgage_expense: "1",
          has_space_rent_expense: "1",
          has_property_tax_expense: "0",
          has_child_support_expense: "0",
          has_home_insurance_expense: "0",
          has_child_care_expense: "0",
          has_medical_care_medicine_expense: "0",
          has_wood_coal_expense: "0",
          has_telephone_expense: "0",
          has_water_sewage_expense: "0",
          has_electricity_expense: "0",
          has_propane_gas_expense: "0",
          has_oil_expense: "0",
          none: "0",
        )

        expect(form).to be_valid
      end
    end

    context "when all expenses (and none of the above) are false" do
      it "is invalid" do
        form = WhatLivingExpensesForm.new(
          nil,
          has_rent_mortgage_expense: "0",
          has_space_rent_expense: "0",
          has_property_tax_expense: "0",
          has_child_support_expense: "0",
          has_home_insurance_expense: "0",
          has_child_care_expense: "0",
          has_medical_care_medicine_expense: "0",
          has_wood_coal_expense: "0",
          has_telephone_expense: "0",
          has_water_sewage_expense: "0",
          has_electricity_expense: "0",
          has_propane_gas_expense: "0",
          has_oil_expense: "0",
          none: "0",
        )

        expect(form).not_to be_valid
        expect(form.errors[:living_expenses]).to be_present
      end
    end
  end

  describe "#save" do
    let(:interview) { create :interview }

    let(:valid_params) do
      {
        has_rent_mortgage_expense: "1",
        has_space_rent_expense: "1",
        has_property_tax_expense: "0",
        has_child_support_expense: "0",
        has_home_insurance_expense: "0",
        has_child_care_expense: "0",
        has_medical_care_medicine_expense: "0",
        has_wood_coal_expense: "0",
        has_telephone_expense: "0",
        has_water_sewage_expense: "0",
        has_electricity_expense: "0",
        has_propane_gas_expense: "0",
        has_oil_expense: "0",
      }
    end

    it "persists the values to the correct models" do
      form = WhatLivingExpensesForm.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.has_rent_mortgage_expense).to be_truthy
      expect(interview.has_space_rent_expense).to be_truthy
      expect(interview.has_property_tax_expense).to be_falsey
      expect(interview.has_child_support_expense).to be_falsey
      expect(interview.has_home_insurance_expense).to be_falsey
      expect(interview.has_child_care_expense).to be_falsey
      expect(interview.has_medical_care_medicine_expense).to be_falsey
      expect(interview.has_wood_coal_expense).to be_falsey
      expect(interview.has_telephone_expense).to be_falsey
      expect(interview.has_water_sewage_expense).to be_falsey
      expect(interview.has_electricity_expense).to be_falsey
      expect(interview.has_propane_gas_expense).to be_falsey
      expect(interview.has_oil_expense).to be_falsey
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview,
                         has_rent_mortgage_expense: true,
                         has_space_rent_expense: true,
                         has_property_tax_expense: false,
                         has_child_support_expense: false,
                         has_home_insurance_expense: false,
                         has_child_care_expense: false,
                         has_medical_care_medicine_expense: false,
                         has_wood_coal_expense: false,
                         has_telephone_expense: false,
                         has_water_sewage_expense: false,
                         has_electricity_expense: false,
                         has_propane_gas_expense: false,
                         has_oil_expense: false)

      form = WhatLivingExpensesForm.from_interview(interview)

      expect(form.has_rent_mortgage_expense).to eq("1")
      expect(form.has_space_rent_expense).to eq("1")
      expect(form.has_property_tax_expense).to eq("0")
      expect(form.has_child_support_expense).to eq("0")
      expect(form.has_home_insurance_expense).to eq("0")
      expect(form.has_child_care_expense).to eq("0")
      expect(form.has_medical_care_medicine_expense).to eq("0")
      expect(form.has_wood_coal_expense).to eq("0")
      expect(form.has_telephone_expense).to eq("0")
      expect(form.has_water_sewage_expense).to eq("0")
      expect(form.has_electricity_expense).to eq("0")
      expect(form.has_propane_gas_expense).to eq("0")
      expect(form.has_oil_expense).to eq("0")
    end
  end
end
