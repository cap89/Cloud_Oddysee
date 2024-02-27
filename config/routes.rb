Rails.application.routes.draw do
  devise_for :users
  root to: "clouds#index"

  resources :clouds, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:edit]
    # resources :users, only: [:new, :create, :edit, :destroy]

end
