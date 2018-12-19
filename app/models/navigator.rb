class Navigator < ApplicationRecord
  belongs_to :interview

  enum interview_type: { unfilled: 0, application: 1, renewal: 2 }, _prefix: :interview_type
  enum lived_outside_alaska: { unfilled: 0, yes: 1, no: 2 }, _prefix: :lived_outside_alaska
  enum citizen: { unfilled: 0, yes: 1, no: 2 }, _prefix: :citizen
end
