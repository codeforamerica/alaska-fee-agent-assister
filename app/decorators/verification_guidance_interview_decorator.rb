class VerificationGuidanceInterviewDecorator < SimpleDelegator
  def application?
    navigator.interview_type_application?
  end

  def needs_immigration?
    !navigator.citizen?
  end

  def needs_pregnancy?
    navigator.pregnant?
  end

  def needs_eviction_notice?
    selected_general_relief?
  end

  def needs_direct_deposit?
    navigator.want_direct_deposit?
  end

  def needs_interim_assistance?
    navigator.interim_assistance?
  end

  def needs_apa_form?
    selected_apa?
  end
end
