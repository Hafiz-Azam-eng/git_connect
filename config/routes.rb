Rails.application.routes.draw do
  
  devise_for :users

  resources :developers
  root 'developers#index'
 
end
