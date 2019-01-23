require "rails_helper"

RSpec.describe AddIdVerificationForm do
  describe "#save" do
    let(:interview) { create :interview }
    let(:active_storage_blob) do
      ActiveStorage::Blob.create_after_upload!(
        io: File.open(Rails.root.join("spec", "fixtures", "image.jpg")),
        filename: "image.jpg",
        content_type: "image/jpg",
      )
    end

    let(:valid_params) do
      {
        documents: ["", active_storage_blob.signed_id],
      }
    end

    it "persists the values to the correct models excluding any empty values" do
      form = described_class.new(interview, valid_params)
      form.valid?
      form.save

      interview.reload

      expect(interview.id_verifications.count).to eq 1
    end

    it "ignores values that are already present" do
      interview.id_verifications.attach(active_storage_blob)
      valid_params[:documents] = [interview.id_verifications.first.signed_id]

      form = described_class.new(interview, valid_params)
      form.valid?

      expect do
        form.save
      end.to_not(change { interview.id_verifications.count })
    end

    it "removes values that are not included anymore" do
      interview.id_verifications.attach(active_storage_blob)
      valid_params[:documents] = []

      form = described_class.new(interview, valid_params)
      form.valid?

      expect do
        form.save
      end.to(change { interview.id_verifications.count }.from(1).to(0))
    end
  end

  describe ".from_interview" do
    it "assigns values from interview" do
      interview = create(:interview, :with_navigator)
      interview.id_verifications.attach(
        io: File.open(Rails.root.join("spec", "fixtures", "image.jpg")),
        filename: "image.jpg",
        content_type: "image/jpg",
      )

      form = described_class.from_interview(interview)

      expect(form.documents.count).to eq 1
      expect(form.documents.first.filename).to eq "image.jpg"
    end
  end
end
