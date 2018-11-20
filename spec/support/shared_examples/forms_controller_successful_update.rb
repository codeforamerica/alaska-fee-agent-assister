require "rails_helper"

RSpec.shared_examples_for "form controller successful update" do |valid_params|
  describe "#update" do
    context "without interview" do
      it "redirects to homepage" do
        put :update, params: { form: valid_params }

        expect(response).to redirect_to(root_path)
      end
    end

    context "with interview" do
      let(:current_interview) { create(:interview, :with_navigator) }

      before do
        session[:current_interview_id] = current_interview.id
      end

      context "on successful update" do
        it "redirects to next path" do
          put :update, params: { form: valid_params }

          expect(response).to redirect_to(subject.next_path)
        end
      end
    end
  end
end
