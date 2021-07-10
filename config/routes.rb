Rails.application.routes.draw do
  get "counter", to: "counter#index"
  get "counter/set_words_quantity"
  post "counter/set_words_quantity"

  root to: "counter#index"
end
