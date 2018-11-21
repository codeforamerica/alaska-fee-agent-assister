require "rails_helper"

RSpec.describe StaticPagesController, type: :controller do
  describe "#index" do
    it "renders the homepage" do
      get :index

      expect(response).to render_template(:index)
    end

    context "with a current interview " do
      it "sets the current interview id to nil" do
        session[:current_interview_id] = 1

        get :index

        expect(session[:current_interview_id]).to be_nil
      end
    end
  end
end
