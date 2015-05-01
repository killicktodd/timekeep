Rails.application.routes.draw do
  get 'orders/new'

  get 'orders/show'

	root "watches#index"
	resources :watches
	resources :users, except: [:index, :show]
	resource :session
end
