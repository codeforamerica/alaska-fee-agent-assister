require "rails_helper"

RSpec.describe CamaDetailsController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller successful update", {
    cama_details: "Best E. Person",
  }

  describe "#show?" do
    context "when applying or renewing for cama" do
      it "returns true" do
        application = create(:interview, selected_cama: true)

        show = CamaDetailsController.show?(application)
        expect(show).to eq(true)
      end
    end

    context "when not applying for cama" do
      it "returns false" do
        application = create(:interview, selected_cama: false)

        show = CamaDetailsController.show?(application)
        expect(show).to eq(false)
      end
    end
  end
end
