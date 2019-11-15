Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, {format: 'json'} do
    resources :shops, only: [:index,:show] do
      resources :comments, only: [:index, :create]
    end
    get '/search', to: 'shops#search', as: 'search'
  end
  root to: 'api/shops#search', defaults: { format: :json }
  get '/health_check', to: 'health_check#index'
end
