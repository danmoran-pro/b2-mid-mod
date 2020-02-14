Rails.application.routes.draw do
  resources :studios, only: [:index] 
  
  resources :actors, only: [:show] 
end
