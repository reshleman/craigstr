require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  constraints Monban::Constraints::SignedIn.new do
    root "locations#index", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "homes#show"
  end

  resources :locations, only: [:index]

  namespace :admin do
    resources :locations, only: [:new, :create]
  end
end
