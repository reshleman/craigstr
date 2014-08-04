require "monban/constraints/signed_in"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  constraints Monban::Constraints::SignedIn.new do
    root "locations#index"
  end

  resources :locations, only: [:index]
  resources :posts, only: [:create, :index]

  namespace :admin do
    resources :locations, only: [:new, :create]
  end
end
