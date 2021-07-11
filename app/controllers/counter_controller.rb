# frozen_string_literal: true

class CounterController < ApplicationController
  before_action :set_text_body, only: %i[index]

  def index
    unless @text_body.size.zero?
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
      words.push("#{word}") if word.count("a-zA-Z") > 0 || word.count("0-9") > 0
    end
    words
  end

  def set_text_body
    @text_body = params[:text_body].present? ? params[:text_body][:text] : ''
  end

  def set_message(words = 0, chars = 0)
    return "You didn't enter anything" if @text_body.size.zero?
    words_message = set_message_words(words)
    char_message = set_message_chars(chars)
    return words_message + char_message
  end

  def set_message_words(words)
    case words
    when 0
      "You didn't enter any words. "
    when 1
      "You entered only #{words} word. "
    else
      "You entered #{words} words. "
    end
  end

  def set_message_chars(chars)
    case chars
    when 0
      "You didn't enter any characters. "
    when 1
      "You entered only #{chars} characters. "
    else
      "You entered #{chars} characters. "
    end
  end

  # TODO: count numbers, paragraphs
  # TODO: erase message when submiting form without words

end
