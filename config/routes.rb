Rails.application.routes.draw do
  resources :programming_languages, only: [:index]

  root 'programming_languages#index'
end
