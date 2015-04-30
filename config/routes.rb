Rails.application.routes.draw do
  get 'watches/index'

  get 'watches/show'

  get 'watches/new'

  get 'watches/edit'

  root "watches#index"
  resources :watches
end
