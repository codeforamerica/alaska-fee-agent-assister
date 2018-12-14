class CamaDetailsForm < Form
  set_attributes_for :interview, :cama_details

  def save
    interview.update(attributes_for(:interview))
  end
end
