Rails.application.routes.draw do
  get 'test/index'

  get 'user_stats/index'

  devise_for :users
  root to:'home#index'
  get 'home/index'
  get 'userstats', to:'user_stat#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
