Rails.application.routes.draw do
  resources :clothing_items
  resources :looks
  get '/gallery' => 'looks#gallery', as: 'gallery'
  get '/votes' => 'votes#get_votes'
  resources :users
  post '/gallery' => 'votes#gallery_vote'
  get '/login' => 'users#login', as: 'login'
  post '/login' => 'sessions#login'
  delete '/logout' => 'sessions#logout'
  root 'users#login'
end
