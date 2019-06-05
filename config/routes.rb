Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,  only: [:index, :create]
  resources :genders, only: [:index]
  resources :orientations, only: [:index]
  resources :pronouns, only: [:index]
  post '/login', to: 'sessions#create', as: 'login'
end
