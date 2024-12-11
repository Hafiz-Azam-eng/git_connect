Rails.application.routes.draw do
  
  devise_for :users

  resources :developers, only: [:index]
  root 'developers#index'
 
end
