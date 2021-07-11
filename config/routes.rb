Rails.application.routes.draw do
  get "counter", to: "counter#index"
  post "counter", to: "counter#index"

  root to: "counter#index"
end
