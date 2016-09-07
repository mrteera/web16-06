Rails.application.routes.draw do
  resources :quotations
  resources :categories

  root to:'quotations#index'
  get 'q', to:'quotations#index'
  get 'search', to:'quotations#search'
  get 'kill', to:'quotations#kill'
  get 'erase', to:'quotations#quotation_cookie_erase'
  get 'export-quotations.json', to:'quotations#export'
  get 'export-quotations.xml', to:'quotations#export'
  get 'import-xml', to:'quotations#import_xml'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
