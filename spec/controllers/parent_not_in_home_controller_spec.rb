require "rails_helper"

RSpec.describe ParentNotInHomeController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    parent_not_in_home: "true",
  }

  describe "#show?" do
    context "when children in home" do
      it "returns true" do
        application = create(:interview,
          navigator: build(:navigator,
            interview_type: "application",
            children_in_home: true))

        show = ParentNotInHomeController.show?(application)
        expect(show).to eq(true)
      end
    end

    context "when no children in home" do
      it "returns false" do
        application = create(:interview,
          navigator: build(:navigator,
            interview_type: "application",
            children_in_home: false))

        show = ParentNotInHomeController.show?(application)
        expect(show).to eq(false)
      end
    end
  end

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
