Rails.application.routes.draw do
  devise_for :users
  root to: "clouds#index"

  resources :clouds, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:edit, :destroy]
    # resources :users, only: [:new, :create, :edit, :destroy]

  get "profile", to: "pages#profile", as: :profile

end
