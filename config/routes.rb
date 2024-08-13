Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "about", to: "about#index", as: :about


  get 'signup/new', to: 'signup#new'
  post 'signup', to: 'signup#create'

  
  get 'signin', to: 'signup#new'
  post 'signin', to: 'sessions#create'

  
  delete 'logout', to: 'sessions#destroy', as: :logout
  

  resources :entries, only: [:create, :new, :destroy]
  get 'entries/all', to:'entries#index', as: :all

  get 'password', to: "passwords#edit", as: :edit_password
  patch 'password', to: "passwords#update"

  
  get 'pricing', to: 'pricing#index', as: :pricing

  get 'graph', to: 'graph#index', as: :graph

  root to: "main#index"
end

