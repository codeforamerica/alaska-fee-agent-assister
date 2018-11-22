class ClientDetailsForm < Form
  set_attributes_for :interview, :client_name, :client_last_four_ssn, :attendee_names

  validates_presence_of :client_name, message: "Make sure to include their name."
  validates_presence_of :attendee_names, message: "Make sure to tell us who attended the interview."
  validates :client_last_four_ssn, length: { is: 4, message: "Make sure to include the last four digits of their SSN." }

  def save
    interview.update(attributes_for(:interview))
  end

  def self.existing_attributes(interview)
    attributes = interview.attributes
    attributes[:client_last_four_ssn] = interview.client_last_four_ssn
    HashWithIndifferentAccess.new(attributes)
  end
end
