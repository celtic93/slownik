class User < ApplicationRecord
  has_many :user_words, dependent: :destroy
end
