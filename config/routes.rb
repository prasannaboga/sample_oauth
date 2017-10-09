Rails.application.routes.draw do
  resource :profile, except: [:new, :destroy]
  devise_for :users
  root to: 'home#index'
end
