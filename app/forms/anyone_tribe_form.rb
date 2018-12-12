class AnyoneTribeForm < Form
  set_attributes_for :interview, :anyone_tribe

  validates_inclusion_of :anyone_tribe, { in: %w{yes no}, message: "Make sure to choose an option." }

  def save
    interview.update(attributes_for(:interview))
  end
end
