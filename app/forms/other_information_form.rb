class OtherInformationForm < Form
  set_attributes_for :interview, :other_info

  def save
    interview.update(attributes_for(:interview))
  end
end
