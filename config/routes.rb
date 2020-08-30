Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, {format: 'json'} do
    resources :shops, only: [:index,:show] do
      resources :comments, only: [:index, :create]
      resources :congrestion_infos, only: [:create]
    end
    resources :shop_congrestion_infos, only: [:destroy]
    resources :main_shops, only: [:index, :show]
    resources :prefectures, only: [:index, :show]
    resources :areas, only: [:index, :show], param: :area
    resources :stations, only: [:index, :show]
    resources :search_stations, only: [:index]
    resources :search_shops, only: [:index]

    namespace :v1 do
      resources :prefectures, only: [:index, :show], param: :name_e do
        scope module: :prefectures do
          resources :main_shops, only: [:show], param: :eng_name
          resources :cities, only: [:index, :show], param: :code do
            scope module: :cities do
              resources :stations, only: [:show]
              resources :main_shops, only: [:index, :show], param: :eng_name do
                resources :shops, only: [:index, :show], module: :main_shops
              end
            end
          end
        end
      end
      resources :main_shops, only: [:index, :show], param: :eng_name
      namespace :popular do
        resources :stations, only: [:index]
        resources :main_shops, only: [:index]
      end
    end
  end
  root to: 'api/shops#search', defaults: { format: :json }
  resources :health_check, only: [:index]
end
