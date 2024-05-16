class UserWord < ApplicationRecord
  belongs_to :user
  belongs_to :word

  validates :delay_date, presence: true
  validates :user, uniqueness: { scope: :word }
end
