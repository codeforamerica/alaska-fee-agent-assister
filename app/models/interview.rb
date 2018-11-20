class Interview < ApplicationRecord
  has_one :navigator,
          dependent: :destroy
end
