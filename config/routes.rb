Rails.application.routes.draw do
	root "watches#index"
	resources :watches do
		# Get http://localhost:3000/watches/:watch_id/orders/new
		# Post <form action=" /watches/:watch_id/orders/"</form>
		resources :orders, only: [:new, :create]
	end
	resources :orders, only: :show
	resources :users, except: [:index, :show]
	resource :session
end
