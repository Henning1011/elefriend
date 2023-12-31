Rails.application.routes.draw do
  devise_for :users
  root to: "pets#index"

  # Add Routes:
  get "/dashboard", to: "bookings#index", as: :dashboard
  patch "/bookings/:id/accept", to: "bookings#accept", as: :accept
  patch "/bookings/:id/reject", to: "bookings#reject", as: :reject

  resources :pets do
    resources :bookings, only: [:create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
