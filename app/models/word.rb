class Word < ApplicationRecord
  DEFAULT_AND_NEED_OPPOSITE_WORD_KIND = "vocabulary".freeze

  has_many :user_words, dependent: :destroy

  validates :native, :ru, :locale, :kind, presence: true
  validates :pronunciation, presence: true, if: -> { vocabulary? }
  validates :native, uniqueness: { scope: %i[locale kind] }, if: -> { ru.present? }

  enum locale: {
    native: 0,
    ru: 1
  }

  enum kind: {
    vocabulary: 0,
    grammar: 1
  }

  scope :for_exercise, lambda { |user_id, kind|
    left_joins(:user_words).where(kind:, user_words: { user_id:, delay_date: ...Date.today })
                           .or(Word.where.missing(:user_words).where(kind:))
  }

  def front_translation
    native? ? native : ru
  end

  def back_translation
    native? ? ru : native
  end
end
