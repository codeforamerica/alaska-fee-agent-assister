class Interview < ApplicationRecord
  has_one :navigator,
          dependent: :destroy

  attr_encrypted :client_last_four_ssn, key: CredentialsHelper.secret_key_for_ssn_encryption

  enum any_not_listed: { unfilled: 0, yes: 1, no: 2 }, _prefix: :any_not_listed
end
