class MultipleWordsController < ApplicationController
  add_flash_types :words_messages

  def new; end

  def create
    @result = MultipleWords::Create.new(multiple_words_params).create_words

    redirect_to new_multiple_word_path, words_messages: @result.words_messages
  end

  private

  def multiple_words_params
    params.fetch(:multiple_words, {}).permit(:kind, :words_attributes)
  end
end
