Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  mount Logs::Engine => '/logs'

  post '/graphql', to: 'graphql#execute'
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

  resources :webhooks do
    collection do
      post :github
    end
  end
  resource :home, controller: :home
  resource :profile, except: [:new, :destroy] do
    get 'public/:friendly_id', action: :public_profile, as: :public
  end
  resource :admin, controller: :admin

  root to: 'home#index'
end
