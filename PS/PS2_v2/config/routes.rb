Rails.application.routes.draw do
  resources :quotations
  resources :categories

  root to:'quotations#index'
  get 'q', to:'quotations#index'
  get 'search', to:'quotations#search'
  get 'kill', to:'quotations#kill'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
