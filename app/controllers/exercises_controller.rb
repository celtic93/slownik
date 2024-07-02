class ExercisesController < ApplicationController
  def show
    @result = Exercises::Show.new(current_user.id).set_exercise_data
  end

  def update
    if params[:correct]
      user_word = UserWord.find_or_create_by(user_id: current_user.id, word_id: params[:word_id])
      user_word.update(delay_date: ENV["DELAY_DAYS_NUMBER"].to_i.days.from_now)
    end

    redirect_to exercise_path
  end
end
