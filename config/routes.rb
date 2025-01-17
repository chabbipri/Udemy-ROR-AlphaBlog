Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"

  # Pages
  get "about", to: "pages#about"

  # Articles
  resources :articles, only: %i[show index create new]
end
