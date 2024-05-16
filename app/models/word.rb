class Word < ApplicationRecord
  validates :native, :ru, :pronunciation, :locale, presence: true
  validates :native, uniqueness: true, if: -> { ru.present? }

  enum locale: {
    native: 0,
    ru: 1
  }
end
