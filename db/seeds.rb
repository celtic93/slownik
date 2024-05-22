# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

p 'Creating user'
User.create

p 'Creating words'
word_attributes1 = {
  native: "test",
  ru: "тест",
  pronunciation: "https://upload.wikimedia.org/wikipedia/commons/c/c0/LL-Q809_%28pol%29-Olaf-test.wav"
}
Word.create(word_attributes1.merge(locale: :ru))
Word.create(word_attributes1.merge(locale: :native))

word_attributes2 = {
  native: "słownik",
  ru: "словарь, лексикон, лексика",
  pronunciation: "https://upload.wikimedia.org/wikipedia/commons/4/45/Pl-słownik.ogg"
}
Word.create(word_attributes2.merge(locale: :ru))
Word.create(word_attributes2.merge(locale: :native))

word_attributes3 = {
  native: "kiedy",
  ru: "когда, пока, в то время как",
  pronunciation: "https://upload.wikimedia.org/wikipedia/commons/2/2c/Pl-kiedy.ogg"
}
Word.create(word_attributes3.merge(locale: :ru))
Word.create(word_attributes3.merge(locale: :native))

word_attributes4 = {
  native: "przepraszać",
  ru: "извиняться, извиниться, простить",
  pronunciation: "https://upload.wikimedia.org/wikipedia/commons/7/74/Pl-przepraszać.ogg"
}
Word.create(word_attributes4.merge(locale: :ru))
Word.create(word_attributes4.merge(locale: :native))

word_attributes5 = {
  native: "kochanie",
  ru: "любимый, любимая, душенька ",
  pronunciation: "https://upload.wikimedia.org/wikipedia/commons/c/cf/Pl-kochanie.ogg"
}
Word.create(word_attributes5.merge(locale: :ru))
Word.create(word_attributes5.merge(locale: :native))

word_attributes6 = {
  native: "człowiek",
  ru: "человек, мужчина",
  pronunciation: "https://upload.wikimedia.org/wikipedia/commons/5/52/Pl-człowiek.ogg"
}
Word.create(word_attributes6.merge(locale: :ru))
Word.create(word_attributes6.merge(locale: :native))

p 'Creating user_word with delay for tomorrow'
UserWord.create(user: User.first, word: Word.first, delay_date: Date.tomorrow)
UserWord.create(user: User.first, word: Word.last, delay_date: Date.tomorrow)

p 'All seeds created successfully'
