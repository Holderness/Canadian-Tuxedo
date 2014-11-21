Rails.application.routes.draw do
  resources :clothing_items
  resources :looks
  get '/gallery' => 'looks#gallery', as: 'gallery'
  resources :users
  get '/login' => 'users#login', as: 'login'
  post '/login' => 'sessions#login'
  delete '/logout' => 'sessions#logout'
  root 'users#login'
end
