Rails.application.routes.draw do
  root 'problem_sets#index'
  get 'problem_sets/index'
  get 'youtube_trends/index'
  get 'zero', to: 'youtube_trends#divided_by_zero'
  get 'about-to-div-by-zero', to: 'youtube_trends#about_to_divided_by_zero'
  get 'youtube_trends', to: 'youtube_trends#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
