Rails.application.routes.draw do
  root to: 'root#home'
  resources :users, only: [:destroy, :update, :show, :edit, :update, :new, :create]
  resource :session, only: [:new, :create, :destroy]
end
