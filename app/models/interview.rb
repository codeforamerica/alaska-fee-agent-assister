class Interview < ApplicationRecord
  has_one :navigator,
          dependent: :destroy

  attr_encrypted :client_last_four_ssn, key: CredentialsHelper.secret_key_for_ssn_encryption

  enum any_not_listed: { unfilled: 0, yes: 1, no: 2 }, _prefix: :any_not_listed
  enum any_away_from_home: { unfilled: 0, yes: 1, no: 2 }, _prefix: :any_away_from_home
  enum anyone_convicted_drug_felony: { unfilled: 0, yes: 1, no: 2 }, _prefix: :anyone_convicted_drug_felony
  enum completed_probation_or_parole: { unfilled: 0, yes: 1, no: 2 }, _prefix: :completed_probation_or_parole
  enum completed_treatment_program: { unfilled: 0, yes: 1, no: 2 }, _prefix: :completed_treatment_program
  enum taken_action_towards_rehabilitation: { unfilled: 0, yes: 1, no: 2 },
       _prefix: :taken_action_towards_rehabilitation
  enum complied_with_reentry: { unfilled: 0, yes: 1, no: 2 }, _prefix: :complied_with_reentry
  enum anyone_tribe: { unfilled: 0, yes: 1, no: 2 }, _prefix: :anyone_tribe
  enum anyone_stopped_work: { unfilled: 0, yes: 1, no: 2 }, _prefix: :anyone_stopped_work
  enum has_quest_card: { unfilled: 0, yes: 1, no: 2 }, _prefix: :has_quest_card
  enum anyone_filing_tax_return: { unfilled: 0, yes: 1, no: 2 }, _prefix: :anyone_filing_tax_return
  # Generated enums added above
  enum intend_to_stay: { unfilled: 0, yes: 1, no: 2 }, _prefix: :intend_to_stay
end
