require "rails_helper"

RSpec.describe InterviewTypeController do
  it_behaves_like "form controller base behavior", is_last_section: true

  it_behaves_like "form controller unsuccessful update"
  it_behaves_like "form controller always shows"

  describe "#edit" do
    context "without current interview" do
      it "renders edit without redirect" do
        get :edit

        expect(response).to render_template(:edit)
      end
    end
  end

  describe "#update" do
    context "on successful update" do
      it "redirects to next path" do
        put :update, params: { form: { interview_type: "application" } }

        expect(response).to redirect_to(subject.next_path)
      end
    end
  end
end
