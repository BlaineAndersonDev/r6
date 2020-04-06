Rails.application.routes.draw do
  root 'weathers#index'
  resources :users
  resources :weathers
  post 'weathers/create'
  post 'weathers/toggle_to_c'
  post 'weathers/toggle_to_f'
end
