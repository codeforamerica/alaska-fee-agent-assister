class AnyoneStoppedWorkForm < Form
  set_attributes_for :interview, :anyone_stopped_work

  validates_inclusion_of :anyone_stopped_work, { in: %w{yes no}, message: "Make sure to choose an option." }

  def save
    interview.update(attributes_for(:interview))
  end
end
