class CounterController < ApplicationController
  before_action :set_text_body, only: %i[index]

  def index
    set_words_quantity if params[:text_body].present?
    flash[:notice] = set_message(params[:text_body_size].to_i) if params[:text_body_size].present?
  end

  def set_words_quantity
    text_body_size = set_text_body(params[:text_body][:text]).split.size
    redirect_to counter_path(words_counted: @text_body, text_body_size: text_body_size)
  end

  def set_text_body(words = '')
    @text_body = params[:words_counted].present? ? params[:words_counted] : words
  end

  def set_message(text_body_size = 0)
    return "You didn't enter any words" if text_body_size.zero?

    text_body_size > 1 ? "You entered #{text_body_size} words" : "You entered only #{text_body_size} word"
  end


  # TODO: count symbols and numbers
  # TODO: erase message when submiting form without words

end
