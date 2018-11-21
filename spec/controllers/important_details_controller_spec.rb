require "rails_helper"

RSpec.describe ImportantDetailsController do
  it_behaves_like "form controller base behavior", is_last_section: true
  it_behaves_like "form controller always shows"

  describe "#edit" do
    context "without current interview" do
      it "renders edit without redirect" do
        get :edit

        expect(response).to render_template(:edit)
      end
    end
  end
end
