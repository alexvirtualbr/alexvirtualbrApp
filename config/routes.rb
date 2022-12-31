Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  
  get  'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get  'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  resources :sessions, only: [:index, :show, :destroy]
  resource  :password, only: [:edit, :update]

  namespace :site do
    get 'contact/index'
    get 'about/index'
    get 'portifolio/index'
  end

  namespace :admin do
    get 'dashboard/index'
  end

  namespace :identity do
    resource :email,              only: [:edit, :update]
    resource :email_verification, only: [:edit, :create]
    resource :password_reset,     only: [:new, :edit, :create, :update]
  end

end
