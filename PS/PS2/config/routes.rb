Rails.application.routes.draw do
  resources :allquotations
  resources :categories
  root to:'allquotations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
