Rails.application.routes.draw do
  get 'youtube_trends/index'

  root 'youtube_trends#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
