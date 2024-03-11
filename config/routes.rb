Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end

  resources :user_interests, only: [:new, :create]
  resources :matches, only: [:create]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "profile", to: "pages#profile"

  get "/find-buddies", to: "pages#find_buddies"
  get "/profile/:id", to: "pages#show", as: :buddy_profile

  # Defines the root path route ("/")
  # root "posts#index"
end
