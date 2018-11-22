module CredentialsHelper
  class << self
    def secret_key_for_ssn_encryption
      environment_credential_for_key(:secret_key_for_ssn_encryption,
                                     alternate_value: "This is a key that is 256 bits!!")
    end

    def basic_auth_username
      environment_credential_for_key("basic_auth_username", alternate_value: "admin")
    end

    def basic_auth_password
      environment_credential_for_key("basic_auth_password", alternate_value: "password")
    end

    def environment_credential_for_key(key, alternate_value: nil)
      if Rails.env.test? || Rails.env.development?
        alternate_value
      else
        Rails.application.credentials[Rails.env.to_sym][key.to_sym]
      end
    end
  end
end
