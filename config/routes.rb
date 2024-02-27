Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :clouds, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:edit]
    # resources :users, only: [:new, :create, :edit, :destroy]
end

# /	GET	clouds	index✅
# clouds/:id	GET	clouds	show ✅
# clouds/new	GET	clouds	new ✅
# clouds/create	POST	clouds	create ✅
# clouds/:id/edit	GET	clouds	edit ✅
# clouds/:id	PATCH	coulds	update ✅
# clouds/:id	DELETE	coulds	destroy ✅

# /clouds/:cloud_id/new	GET	bookings	new
# /clouds/:cloud_id/bookings	POST	bookings	create

# bookings/index	GET	bookings	bookings home
# bookings/:id	GET	bookings	nookings show
