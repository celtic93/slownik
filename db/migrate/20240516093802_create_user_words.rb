class CreateUserWords < ActiveRecord::Migration[7.1]
  def change
    create_table :user_words, comment: "Keeps user's interactions with words data" do |t|
      t.references :user, comment: "Belongs to User", null: false, foreign_key: true
      t.references :word, comment: "Belongs to Word", null: false, foreign_key: true
      t.date :delay_date, comment: "Don't show the word until this date"

      t.timestamps
    end
  end
end
