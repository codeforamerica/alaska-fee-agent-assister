module CredentialsHelper
  class << self
    def basic_auth_username
      CredentialsHelper.environment_credential_for_key("basic_auth_username", alternate_value: "admin")
    end

    def basic_auth_password
      CredentialsHelper.environment_credential_for_key("basic_auth_password", alternate_value: "password")
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
