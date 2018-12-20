class ParentNotInHomeForm < Form
  set_attributes_for :navigator, :parent_not_in_home

  def save
    interview.navigator.update(attributes_for(:navigator))
  end

  def self.existing_attributes(interview)
    HashWithIndifferentAccess.new(interview.navigator.attributes)
  end
end
