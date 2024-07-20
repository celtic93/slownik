module Exercises
  class Update
    attr_accessor :is_correct, :kind, :result, :user_id, :user_word, :word_id

    def initialize(user_id:, word_id:, kind:, is_correct:)
      @result = Result.new
      @kind = kind
      @user_id = user_id
      @word_id = word_id
      @is_correct = is_correct
    end

    def update_user_word
      find_or_create_user_word
      update_user_word_with_params
      set_result_kind

      result
    end

    private

    def find_or_create_user_word
      @user_word = UserWord.find_or_create_by(user_id:, word_id:)
    end

    def update_user_word_with_params
      attributes = { last_exercise_correct: is_correct, delay_date: Date.yesterday }

      if is_correct
        delay_days_number =
          user_word.last_exercise_correct? ? ENV["CORRECT_DELAY_DAYS_NUMBER"] : ENV["INCORRECT_DELAY_DAYS_NUMBER"]
        attributes[:delay_date] = delay_days_number.to_i.days.from_now
      end

      user_word.update(attributes)
    end

    def set_result_kind
      result.kind = kind
    end

    class Result
      attr_accessor :kind
    end
  end
end
