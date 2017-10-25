Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'}

  namespace :admin do
    resources :users do
      member do
        get :oauth_access_tokens
      end
    end
  end

  namespace :api do
    resource :profile, except: [:new, :destroy]
    resources :users
  end

  resource :home, controller: :home
  resource :profile, except: [:new, :destroy]
  resource :admin, controller: :admin

  root to: 'home#index'
end
