class CreateWords < ActiveRecord::Migration[7.1]
  def change
    create_table :words, comment: "Words table" do |t|
      t.string "native", comment: "Associate language word translation"
      t.string "ru", comment: "Russian word translation"
      t.integer "locale", comment: "Locale of word for exercise check"
      t.string "pronunciation", comment: "Link to external audio file with word pronunciation"

      t.timestamps
    end
  end
end
