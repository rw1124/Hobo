Rails.application.routes.draw do
  root to: 'results#index'

  resources :users
  resources :results
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: 'users#new'

  delete 'logout', to: 'users#destroy'

  get '/', to: 'users#new'

  post '/lookup', to: 'results#create'
end
