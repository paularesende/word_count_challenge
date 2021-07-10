class CounterController < ApplicationController
  before_action :set_text_body, only: %i[set_words_quantity]

  def index
    set_words_quantity if params[:text]
  end

  def set_words_quantity
    text_body_size = @text_body.split.size
    flash[:notice] = set_message(text_body_size)
    redirect_to counter_path
  end

  def set_message(text_body_size)
    return "You didn't enter any words" if text_body_size == 0
    text_body_size > 1 ? "You entered #{text_body_size} words" : "You entered only #{text_body_size} word"
  end

  def set_text_body
    @text_body = params[:text_body].present? ? params[:text_body][:text] : Counter.new
  end
end
