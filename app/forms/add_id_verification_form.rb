class AddIdVerificationForm < Form
  set_attributes_for :interview, documents: []

  def save
    self.documents ||= []
    documents_to_attach = documents.reject do |document_signed_id|
      document_signed_id.blank? ||
        interview.id_verifications.map(&:signed_id).include?(document_signed_id)
    end
    interview.id_verifications.attach(documents_to_attach)
    interview.id_verifications.each do |document|
      document.delete if documents.exclude?(document.signed_id)
    end
  end

  def self.existing_attributes(interview)
    {
      documents: interview.id_verifications,
    }
  end
end
