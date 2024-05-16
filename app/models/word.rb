class Word < ApplicationRecord
  has_many :user_words

  validates :native, :ru, :pronunciation, :locale, presence: true
  validates :native, uniqueness: true, if: -> { ru.present? }

  enum locale: {
    native: 0,
    ru: 1
  }
end
