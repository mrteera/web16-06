Rails.application.routes.draw do
  root 'problem_sets#index'

  get 'youtube_trends', to: 'youtube_trends#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
