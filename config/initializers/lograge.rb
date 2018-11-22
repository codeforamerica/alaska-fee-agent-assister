Rails.application.configure do
  config.lograge.enabled = true

  config.lograge.custom_payload do |controller|
    {
      interview_id: controller.try(:current_interview).try(:id),
    }
  end
end
