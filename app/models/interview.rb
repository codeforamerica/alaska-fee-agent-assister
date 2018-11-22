class Interview < ApplicationRecord
  has_one :navigator,
          dependent: :destroy

  attr_encrypted :client_last_four_ssn, key: CredentialsHelper.secret_key_for_ssn_encryption
end
