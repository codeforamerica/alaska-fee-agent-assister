require "rails_helper"

describe VerificationGuidanceInterviewDecorator do
  describe "#is_application?" do
    context "it is an application type" do
      it "returns true" do
        interview = create(:interview, :with_navigator, interview_type: :application)
        decorated_interview = VerificationGuidanceInterviewDecorator.new(interview)
        expect(decorated_interview.application?).to be_truthy
      end
    end

    context "it is a renewal type" do
      it "returns false" do
        interview = create(:interview, :with_navigator, interview_type: :renewal)
        decorated_interview = VerificationGuidanceInterviewDecorator.new(interview)
        expect(decorated_interview.application?).to be_falsey
      end
    end
  end

  describe "#needs_immigration?" do
    context "not US citizens" do
      it "returns true" do
        interview = create(:interview, navigator: build(:navigator, citizen: false))
        decorated_interview = VerificationGuidanceInterviewDecorator.new(interview)
        expect(decorated_interview.needs_immigration?).to be_truthy
      end
    end

    context "they are US citizens" do
      it "returns false" do
        interview = create(:interview, navigator: build(:navigator, citizen: true))
        decorated_interview = VerificationGuidanceInterviewDecorator.new(interview)
        expect(decorated_interview.needs_immigration?).to be_falsey
      end
    end
  end

  describe "#needs_pregnancy?" do
    context "not pregnant" do
      it "returns false" do
        interview = create(:interview, navigator: build(:navigator, pregnant: false))
        decorated_interview = VerificationGuidanceInterviewDecorator.new(interview)
        expect(decorated_interview.needs_pregnancy?).to be_falsey
      end
    end

    context "they are pregnant" do
      it "returns true" do
        interview = create(:interview, navigator: build(:navigator, pregnant: true))
        decorated_interview = VerificationGuidanceInterviewDecorator.new(interview)
        expect(decorated_interview.needs_pregnancy?).to be_truthy
      end
    end
  end

  describe "#needs_eviction_notice?" do
    context "applying for general relief" do
      it "returns true" do
        interview = create(:interview, selected_general_relief: true)
        decorated_interview = VerificationGuidanceInterviewDecorator.new(interview)
        expect(decorated_interview.needs_eviction_notice?).to be_truthy
      end
    end

    context "not applying for general relief" do
      it "returns false" do
        interview = create(:interview, selected_general_relief: false)
        decorated_interview = VerificationGuidanceInterviewDecorator.new(interview)
        expect(decorated_interview.needs_eviction_notice?).to be_falsey
      end
    end
  end

  describe "#needs_direct_deposit?" do
    context "direct deposit wanted" do
      it "returns true" do
        interview = create(:interview, navigator: build(:navigator, want_direct_deposit: true))
        decorated_interview = VerificationGuidanceInterviewDecorator.new(interview)
        expect(decorated_interview.needs_direct_deposit?).to be_truthy
      end
    end

    context "direct deposit not wanted" do
      it "returns false" do
        interview = create(:interview, navigator: build(:navigator, want_direct_deposit: false))
        decorated_interview = VerificationGuidanceInterviewDecorator.new(interview)
        expect(decorated_interview.needs_direct_deposit?).to be_falsey
      end
    end
  end

  describe "#needs_interim_assistance?" do
    context "interim assistance wanted" do
      it "returns true" do
        interview = create(:interview, navigator: build(:navigator, interim_assistance: true))
        decorated_interview = VerificationGuidanceInterviewDecorator.new(interview)
        expect(decorated_interview.needs_interim_assistance?).to be_truthy
      end
    end

    context "interim assistance not wanted" do
      it "returns false" do
        interview = create(:interview, navigator: build(:navigator, interim_assistance: false))
        decorated_interview = VerificationGuidanceInterviewDecorator.new(interview)
        expect(decorated_interview.needs_interim_assistance?).to be_falsey
      end
    end
  end

  describe "#needs_apa_form?" do
    context "applying for adult public assistance" do
      it "returns true" do
        interview = create(:interview, selected_apa: true)
        decorated_interview = VerificationGuidanceInterviewDecorator.new(interview)
        expect(decorated_interview.needs_apa_form?).to be_truthy
      end
    end

    context "not applying for adult public assistance" do
      it "returns false" do
        interview = create(:interview, selected_apa: false)
        decorated_interview = VerificationGuidanceInterviewDecorator.new(interview)
        expect(decorated_interview.needs_apa_form?).to be_falsey
      end
    end
  end
end
