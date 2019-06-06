Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,  only: [:index, :show], defaults: {format: :json}
  resources :genders, only: [:index]
  resources :orientations, only: [:index]
  resources :pronouns, only: [:index]
  resources :interests, only: [:index]
  post '/login', to: 'sessions#create', as: 'login'
  post '/users', to: 'users#create', as: 'create'
end
