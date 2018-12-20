require "rails_helper"

RSpec.describe ChildrenInHomeController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    children_in_home: "true",
  }
  it_behaves_like "yes no forms controller with boolean values"

  describe "#show?" do
    context "when application" do
      context "when applying for medicaid" do
        it "returns true" do
          application = create(:interview,
                               selected_medicaid: true,
                               navigator: build(:navigator, interview_type: "application"))

          show = ChildrenInHomeController.show?(application)
          expect(show).to eq(true)
        end
      end

      context "when applying for atap" do
        it "returns true" do
          application = create(:interview,
                               selected_atap: true,
                               navigator: build(:navigator, interview_type: "application"))

          show = ChildrenInHomeController.show?(application)
          expect(show).to eq(true)
        end
      end

      context "when not applying for medicaid or atap" do
        it "returns false" do
          application = create(:interview,
                               selected_cama: false,
                               selected_atap: false,
                               navigator: build(:navigator, interview_type: "application"))

          show = ChildrenInHomeController.show?(application)
          expect(show).to eq(false)
        end
      end
    end

    context "when renewing" do
      it "returns false" do
        application = create(:interview,
                             selected_atap: true,
                             navigator: build(:navigator, interview_type: "renewal"))

        show = ChildrenInHomeController.show?(application)
        expect(show).to eq(false)
      end
    end
  end
end
