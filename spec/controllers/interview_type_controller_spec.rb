require "rails_helper"

RSpec.describe InterviewTypeController do
  it_behaves_like "form controller base behavior"
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
    context "with valid params" do
      let(:valid_params) do
        {
          interview_type: "application",
        }
      end

      context "on successful update" do
        it "redirects to next path and updates the interview" do
          current_interview = create(:interview, :with_navigator, interview_type: "renewal")
          session[:current_interview_id] = current_interview.id

          put :update, params: { form: valid_params }

          current_interview.reload

          expect(response).to redirect_to(subject.next_path)
          expect(current_interview.navigator.interview_type).to eq("application")
        end

        context "without an existing interview" do
          it "redirects to next path and creates the interview" do
            put :update, params: { form: valid_params }

            current_interview = Interview.find(session[:current_interview_id])

            expect(response).to redirect_to(subject.next_path)
            expect(current_interview.navigator.interview_type).to eq("application")
          end
        end
      end
    end

    context "with invalid params" do
      let(:invalid_params) do
        {
          interview_type: "googly",
        }
      end

      it "renders edit" do
        put :update, params: { form: invalid_params }

        expect(response).to render_template(:edit)
      end
    end
  end
end
