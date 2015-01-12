Rails.application.routes.draw do
  root to: 'root#home'
  resources :users, only: [:destroy, :update, :show, :edit, :update, :new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :decks do
    resources :cards, except: :index
  end

  resources :schools, only: [:index, :show, :create]
  resources :courses, only: [:index, :show, :create]
  resources :registrations, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :decks do
      resources :cards
      resources :tests
    end

    resources :schools, only: [:index, :show, :create]
    resources :courses, only: [:index, :show, :create]
    resources :registrations, only: [:new, :create, :destroy]
  end
end
