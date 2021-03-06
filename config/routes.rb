require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  constraints Monban::Constraints::SignedIn.new do
    root "locations#index", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "homes#show"
  end

  resources :locations, only: [:index, :show] do
    resources :categories, only: [:show] do
      resources :posts, only: [:new, :create]
    end
  end

  resources :posts, only: [:show, :destroy] do
    resources :spam_flags, only: [:create]
  end

  namespace :admin do
    resource :dashboard, only: [:show]
    resources :locations, only: [:new, :create] do
      resources :categories, only: [:new, :create]
    end
  end
end
