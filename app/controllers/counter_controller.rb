class CounterController < ApplicationController
  before_action :set_text_body, only: %i[index]

  def index
    if @text_body.present?
      words_quantity = set_words_quantity
      char_quantity = set_characters_quantity
      flash[:notice] = set_message(words_quantity, char_quantity)
    end
  end

  def set_words_quantity
    set_words.size
  end

  def set_characters_quantity
    @text_body.gsub(/\s+/, '').length
  end

  def set_words
    words = []
    @text_body.split.each do |word|
      words.push("#{word}") if word.count("a-zA-Z") > 0
    end
    words
  end

  def set_text_body
    @text_body = params[:text_body].present? ? params[:text_body][:text] : ''
  end

  def set_message(words = 0, char = 0)
    return "You didn't enter any words" if words.zero?

    words_message = words > 1 ? "You entered #{words} words. " : "You entered only #{words} word "
    char_message = char > 1 ? "You entered #{char} characters. " : "You entered only #{char} character. "

    return words_message + char_message
  end


  # TODO: count numbers, paragraphs
  # TODO: erase message when submiting form without words

end
