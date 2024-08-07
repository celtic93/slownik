# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_20_124622) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_words", comment: "Keeps user's interactions with words data", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "Belongs to User"
    t.bigint "word_id", null: false, comment: "Belongs to Word"
    t.date "delay_date", comment: "Don't show the word until this date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "last_exercise_correct", default: true, null: false, comment: "Keep previous answer and set delay date according to this value"
    t.index ["user_id"], name: "index_user_words_on_user_id"
    t.index ["word_id"], name: "index_user_words_on_word_id"
  end

  create_table "users", comment: "Users table", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", comment: "Words table", force: :cascade do |t|
    t.string "native", comment: "Associate language word translation"
    t.string "ru", comment: "Russian word translation"
    t.integer "locale", comment: "Locale of word for exercise check"
    t.string "pronunciation", comment: "Link to external audio file with word pronunciation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind", default: 0, comment: "Type of exercise to separate vocabulary and grammar"
  end

  add_foreign_key "user_words", "users"
  add_foreign_key "user_words", "words"
end
