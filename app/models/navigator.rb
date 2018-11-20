class Navigator < ApplicationRecord
  belongs_to :interview

  enum interview_type: { unfilled: 0, application: 1, renewal: 2 }, _prefix: :interview_type
end
