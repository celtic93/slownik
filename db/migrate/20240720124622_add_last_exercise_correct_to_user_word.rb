class AddLastExerciseCorrectToUserWord < ActiveRecord::Migration[7.1]
  def change
    add_column :user_words,
               :last_exercise_correct,
               :boolean,
               default: true,
               null: false,
               comment: "Keep previous answer and set delay date according to this value"
  end
end
