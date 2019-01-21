Rails.application.routes.draw do
  get 'search/results'
  get '/search/auto_title'

  resources :categories
  root 'static_pages#home', as: 'root'

  get 'payment', to: 'static_pages#payment', as: 'payment'
  get 'delivery', to: 'static_pages#delivery', as: 'delivery'
  get 'about', to: 'static_pages#about', as: 'about'

  get 'adnim', to: 'stuffs#index', as: 'adnim'
  resources :stuffs, exept: [:index] , param: :slug
  get '/tagged', to: 'stuffs#tagged', as: :tagged
  resources :comments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
