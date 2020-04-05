Rails.application.routes.draw do
  root 'weathers#index'
  resources :users
  resources :weathers
  post 'weathers/create'
end
