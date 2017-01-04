Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :todos,
              only: [:show, :create, :destroy, :index, :update],
              defaults: { format: :json }
  end

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  root to: 'static_pages#root'
end
