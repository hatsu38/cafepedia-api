Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, {format: 'json'} do
    resources :shops, only: [:index,:show] do
      resources :comments, only: [:index, :create]
      resources :congrestion_infos, only: [:create]
    end
    resources :shop_congrestion_infos, only: [:destroy]
    resources :main_shops, only: [:index]
    resources :prefecture, only: [:index, :show]
    get '/search', to: 'shops#search', as: 'search'
    get '/stations/search', to: 'stations#search', as: 'stations_search'
  end
  root to: 'api/shops#search', defaults: { format: :json }
  get '/health_check', to: 'health_check#index'
end
