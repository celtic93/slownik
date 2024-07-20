class ExercisesController < ApplicationController
  def show
    @result = Exercises::Show.new(
      user_id: current_user.id,
      kind: params[:kind] || Word::DEFAULT_AND_NEED_OPPOSITE_WORD_KIND
    ).set_exercise_data
  end

  def update
    result = Exercises::Update.new(
      user_id: current_user.id,
      word_id: params[:word_id],
      kind: params[:kind],
      is_correct: params[:correct].present?
    ).update_user_word

    redirect_to exercise_path(kind: result.kind)
  end
end
