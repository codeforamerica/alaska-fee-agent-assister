class TenDigitPhoneNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank? || !value.match?(/\A\d{10}\z/)
      record.errors[attribute] <<
        "Make sure to enter a valid 10-digit phone number."
    end
  end
end
