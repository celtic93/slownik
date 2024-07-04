class WordsController < ApplicationController
  OPPOSITE_WORD_KIND = "vocabulary".freeze

  before_action :set_word, only: %i[show edit update destroy]

  def index
    @words = Word.order(:native).all
  end

  def show; end

  def new
    @word = Word.new
  end

  def edit; end

  def create
    @word = Word.new(word_params.merge(locale: :ru))
    @word2 = Word.new(word_params.merge(locale: :native)) if need_to_create_opposite_word

    if @word.save && (@word2.nil? || @word2.save)
      redirect_to words_url, notice: "Word was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @word.update(word_params)
      redirect_to @word, notice: "Word was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @word.destroy!
    redirect_to words_url, notice: "Word was successfully destroyed.", status: :see_other
  end

  private

  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.fetch(:word, {}).permit(:native, :ru, :pronunciation, :kind)
  end

  def need_to_create_opposite_word
    word_params[:kind] == OPPOSITE_WORD_KIND
  end
end
