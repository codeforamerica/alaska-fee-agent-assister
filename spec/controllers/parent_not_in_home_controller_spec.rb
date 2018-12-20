require "rails_helper"

RSpec.describe ParentNotInHomeController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    parent_not_in_home: "true",
  }
  it_behaves_like "yes no forms controller with boolean values"

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
end
