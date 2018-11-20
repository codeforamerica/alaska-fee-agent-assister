require "rails_helper"

RSpec.describe StaticPagesController, type: :controller do
  describe "#index" do
    it "renders the homepage" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
