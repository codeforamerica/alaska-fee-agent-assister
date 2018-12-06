class Interview < ApplicationRecord
  has_one :navigator,
          dependent: :destroy

  attr_encrypted :client_last_four_ssn, key: CredentialsHelper.secret_key_for_ssn_encryption

  enum any_not_listed: { unfilled: 0, yes: 1, no: 2 }, _prefix: :any_not_listed
  enum any_away_from_home: { unfilled: 0, yes: 1, no: 2 }, _prefix: :any_away_from_home
  enum anyone_convicted_drug_felony: { unfilled: 0, yes: 1, no: 2 }, _prefix: :anyone_convicted_drug_felony
  # Generated enums added above
end
