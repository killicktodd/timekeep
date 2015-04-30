Rails.application.routes.draw do
	root "watches#index"
	resources :watches
	resources :users, except: [:index, :show]
end
