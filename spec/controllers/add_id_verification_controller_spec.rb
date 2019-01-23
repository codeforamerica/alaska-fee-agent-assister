require "rails_helper"

RSpec.describe AddIdVerificationController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller always shows"

  describe "#update" do
    context "without interview" do
      it "redirects to homepage" do
        put :update, params: { form: {} }

        expect(response).to redirect_to(root_path)
      end
    end

    context "with interview" do
      let(:interview) do
        create(:interview, :with_navigator)
      end

      let(:active_storage_blob) do
        ActiveStorage::Blob.create_after_upload!(
          io: File.open(Rails.root.join("spec", "fixtures", "image.jpg")),
          filename: "image.jpg",
          content_type: "image/jpg",
        )
      end

      before do
        session[:current_interview_id] = interview.id
      end

      context "with documents" do
        let(:valid_params) do
          {
            documents: ["", active_storage_blob.signed_id],
          }
        end

        it "redirects to next path" do
          put :update, params: { form: valid_params }

          expect(response).to redirect_to(subject.next_path)
        end
      end

      context "without documents (ie: Safari)" do
        let(:valid_params) do
          {}
        end

        it "redirects to next path" do
          put :update, params: { form: valid_params }

          expect(response).to redirect_to(subject.next_path)
        end
      end
    end
  end
end
