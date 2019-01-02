require "rails_helper"

RSpec.describe VerificationGuidanceController do
  it_behaves_like "form controller always shows"

  context "with session" do
    let(:current_interview) { create(:interview, :with_navigator) }

    before do
      session[:current_interview_id] = current_interview.id
    end

    describe "#current_interview" do
      it "returns the Interview from the id in the session" do
        expect(controller.current_interview).to eq current_interview
      end
    end

    describe "#edit" do
      it "sets the form and renders the template" do
        get :edit

        expect(response).to render_template(:edit)
        expect(assigns[:interview]).to be_a VerificationGuidanceInterviewDecorator
      end
    end

    describe "#current_path" do
      it "returns the path for this route" do
        expect(controller.current_path).to eq "/screens/#{controller.class.to_param}"
      end
    end

    describe "#next_path" do
      it "returns the next path from this controller" do
        form_navigation = FormNavigation.new(controller)

        expect(controller.next_path).to eq "/screens/#{form_navigation.next.to_param}"
      end
    end
  end
end
