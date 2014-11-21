Rails.application.routes.draw do
  resources :clothing_items
  resources :looks
  resources :users
  post '/gallery' => 'votes#gallery_vote'
  get '/login' => 'users#login', as: 'login'
  post '/login' => 'sessions#login'
  delete '/logout' => 'sessions#logout'
  root 'users#login'
end
