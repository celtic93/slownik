module Exercises
  class Show
    attr_accessor :user_id, :result, :words

    def initialize(user_id)
      @result = Result.new
      @user_id = user_id
    end

    def set_exercise_data
      set_available_words_count
      set_word_for_exercise

      result
    end

    private

    def set_available_words_count
      @words = Word.for_exercise(user_id)
      result.remaining_words_count = words.count - 1
    end

    def set_word_for_exercise
      result.word = words.offset(rand(words.count)).first
    end

    class Result
      attr_accessor :remaining_words_count, :word
    end
  end
end
