Rails.application.routes.draw do
  root 'problem_sets#index'
  get 'problem_sets/index'
  get 'youtube_trends/index'
  get 'youtube_trends', to: 'youtube_trends#index'
  get 'divide-by-zero', to: 'youtube_trends#divide_by_zero'
  get 'about-to-divide-by-zero', to: 'youtube_trends#about_to_divide_by_zero'
  get 'ps-1', to: 'youtube_trends#ps1'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
