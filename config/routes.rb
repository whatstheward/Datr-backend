Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,  only: [:index, :show, :create], defaults: {format: :json}
  resources :genders, only: [:index]
  resources :orientations, only: [:index]
  resources :pronouns, only: [:index]
  resources :interests, only: [:index], defaults: {format: :json}
  resources :relationships, only: [:create, :update, :delete]
  resources :user_dates, only: [:index, :show, :create, :update, :destroy], defaults: {format: :json}
  post '/login', to: 'sessions#create', as: 'login'

  get '/yelp_search', to: 'yelp_api#search', as: 'search'
  get '/yelp_business_details', to: 'yelp_api#business_details', as: 'business_details'

  get '/current_user/:id', to: 'users#current_user_login', as: 'current_user', defaults: {fromat: :json}
  get '/user_search', to: 'users#search', as: 'user_search', defaults: {format: :json}
end
