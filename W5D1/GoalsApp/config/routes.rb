Rails.application.routes.draw do
  resource :session
  resources :users, only: [:new, :create, :show]
  resources :goals
  resources :comments
end
