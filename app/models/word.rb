class Word < ApplicationRecord
  has_many :user_words

  validates :native, :ru, :pronunciation, :locale, presence: true
  validates :native, uniqueness: { scope: :locale }, if: -> { ru.present? }

  enum locale: {
    native: 0,
    ru: 1
  }

  scope :for_exercise, lambda { |user_id|
    left_joins(:user_words).where(user_words: { user_id:, delay_date: ...Date.today })
                           .or(Word.where.missing(:user_words))
  }

  def front_translation
    native? ? native : ru
  end

  def back_translation
    native? ? ru : native
  end
end
