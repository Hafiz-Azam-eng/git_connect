Rails.application.routes.draw do
  
  devise_for :users

  resources :developers, only: [:index, :new, :create]
  root 'developers#index'
 
end
