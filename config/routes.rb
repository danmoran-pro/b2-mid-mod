Rails.application.routes.draw do
  resources :studios, only: [:index] 
  
  resources :actors, only: [:show] 
  resources :movies, only: [:show]
end
