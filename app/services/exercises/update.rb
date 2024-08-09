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
      attributes[:delay_date] = randomize_delay_date if is_correct

      user_word.update(attributes)
    end

    def set_result_kind
      result.kind = kind
    end

    def randomize_delay_date
      delay_days_number = if user_word.last_exercise_correct?
                            rand(ENV["CORRECT_DELAY_DAYS_NUMBER"].to_i..ENV["CORRECT_DELAY_DAYS_NUMBER"].to_i + 2)
                          else
                            rand(ENV["INCORRECT_DELAY_DAYS_NUMBER"].to_i..ENV["INCORRECT_DELAY_DAYS_NUMBER"].to_i + 1)
                          end

      delay_days_number.days.from_now
    end

    class Result
      attr_accessor :kind
    end
  end
end
