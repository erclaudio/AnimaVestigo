Rails.application.routes.draw do
  get 'signup/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "about", to: "about#index", as: :about
  get 'signup', to: 'signup#new'
  post 'signup', to: 'signup#create'
  get 'entries/all', to:'entries#index', as: :all

  # get 'entries', to: 'entries#entries', as: :new_entry
  
  resources :entries, only: [:create, :new, :destroy]
  


  root to: "main#index"
end

