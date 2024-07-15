module MultipleWords
  class Create
    attr_accessor :words_attributes, :kind, :result

    def initialize(multiple_words_params)
      @result = Result.new
      @words_attributes = multiple_words_params[:words_attributes].split("\r\n")
      @kind = multiple_words_params[:kind]
    end

    def create_words
      Word.transaction do
        words_attributes.each do |word_param|
          native, ru, pronunciation = word_param.split(';')
          word_attributes = { native:, ru:, pronunciation: }

          word = Word.new(word_attributes.merge(locale: :native, kind:))
          word2 = Word.new(word_attributes.merge(locale: :ru, kind:)) if need_to_create_opposite_word

          save_words_or_add_errors_to_result(word, word2)
        end
      end

      result
    end

    private

    def need_to_create_opposite_word
      kind == Word::DEFAULT_AND_NEED_OPPOSITE_WORD_KIND
    end

    def save_words_or_add_errors_to_result(word, word2)
      result.words_messages << if word.save && (word2.nil? || word2.save)
                                 { text: "#{word.native} - Successfully created", status: :success }
                               else
                                 { text: "#{word.native} - #{word.errors.full_messages.join(', ')}", status: :error }
                               end
    end

    class Result
      attr_accessor :words_messages

      def initialize
        @words_messages = []
      end
    end
  end
end
