Rails.application.routes.draw do
  root "watches#index"
  resources :watches
end
