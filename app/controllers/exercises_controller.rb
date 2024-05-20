class ExercisesController < ApplicationController
  def show
    @word = Word.random_for_user(current_user.id)
  end

  def update
    
  end
end
