require "rails_helper"

RSpec.shared_examples_for "form controller unsuccessful update" do |invalid_params|
  describe "#update" do
    context "on unsucessful update" do
      let(:current_interview) { create(:interview, :with_navigator) }

      before do
        session[:current_interview_id] = current_interview.id

        put :update, params: { form: invalid_params || {} }
      end

      it "rerenders edit template" do
        expect(response).to render_template(:edit)
      end
    end
  end
end
