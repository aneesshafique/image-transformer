Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "images#new"

  resources :images, only: [:new, :create, :show] do
    member do
      get :compress
      get :convert_to_png
      get :convert_to_bw
    end
  end

  direct :rails_blob do |blob|
    route_for(:rails_service_blob, blob)
  end
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
