class CounterController < ApplicationController
  before_action :set_text_body, only: %i[index]

  def index
    if @text_body.present?
      words_quantity = set_words_quantity
      flash[:notice] = set_message(words_quantity)
    end
  end

  def set_words_quantity
    @text_body.split.size
  end

  def set_text_body
    @text_body = params[:text_body].present? ? params[:text_body][:text] : ''
  end

  def set_message(text_body_size = 0)
    return "You didn't enter any words" if text_body_size.zero?

    text_body_size > 1 ? "You entered #{text_body_size} words" : "You entered only #{text_body_size} word"
  end


  # TODO: count symbols and numbers
  # TODO: erase message when submiting form without words

end
