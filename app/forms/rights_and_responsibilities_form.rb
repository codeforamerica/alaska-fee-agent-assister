class RightsAndResponsibilitiesForm < Form
  set_attributes_for :interview, :explained_rights

  validates :explained_rights, inclusion: {
    in: ["1"],
    message: "Make sure to agree before continuing.",
  }

  def save
    interview.update(attributes_for(:interview))
  end

  def self.existing_attributes(interview)
    {
      explained_rights: checkbox_value(interview.explained_rights),
    }
  end
end
