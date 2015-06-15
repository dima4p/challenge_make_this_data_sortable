Rails.application.routes.draw do
  resources :programming_languages

  root 'programming_languages#index'
end
