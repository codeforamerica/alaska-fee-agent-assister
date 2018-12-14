require "rails_helper"

RSpec.describe StoppedWorkDetailsController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    stopped_work_details: "Snowboard season is over",
  }
  it_behaves_like "form controller unsuccessful update"

  describe "#show?" do
    context "when someone in household is stopped_work" do
      it "returns true" do
        application = create(:interview, anyone_stopped_work: "yes")

        show = StoppedWorkDetailsController.show?(application)
        expect(show).to eq(true)
      end
    end

    context "when no one in household is stopped_work" do
      it "returns false" do
        application = create(:interview, anyone_stopped_work: "no")

        show = StoppedWorkDetailsController.show?(application)
        expect(show).to eq(false)
      end
    end
  end
end
