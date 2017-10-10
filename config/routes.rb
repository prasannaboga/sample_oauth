Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'}

  resource :home, controller: :home
  resource :profile, except: [:new, :destroy]

  root to: 'home#index'
end
