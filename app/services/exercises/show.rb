module Exercises
  class Show
    attr_accessor :kind, :user_id, :result, :words

    def initialize(user_id, kind)
      @result = Result.new
      @user_id = user_id
      @kind = kind
    end

    def set_exercise_data
      set_remaining_words_count
      set_word_for_exercise

      result
    end

    private

    def set_remaining_words_count
      @words = Word.for_exercise(user_id, kind)
      result.remaining_words_count = words.count - 1
    end

    def set_word_for_exercise
      result.word = words.sample
    end

    class Result
      attr_accessor :remaining_words_count, :word
    end
  end
end
