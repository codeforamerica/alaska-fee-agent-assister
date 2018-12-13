class StoppedWorkDetailsForm < Form
  set_attributes_for :interview, :stopped_work_details

  validates_presence_of :stopped_work_details, message: "Please include an answer."

  def save
    interview.update(attributes_for(:interview))
  end
end
