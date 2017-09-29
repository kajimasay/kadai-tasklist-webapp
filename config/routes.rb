Rails.application.routes.draw do
  root to: 'joblists#index'
  
  resources :joblists
end
