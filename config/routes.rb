Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "api/v1/health_check#index"
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :health_check, only: [:index]
      resources :prefectures, only: [:index, :show], param: :name_e do
        scope module: :prefectures do
          resources :main_shops, only: [:index, :show], param: :eng_name
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
      namespace :search do
        resources :keywords, only: [:index]
        resources :positions, only: [:index]
      end
      resources :main_shops, only: [:index, :show], param: :eng_name
      namespace :popular do
        resources :stations, only: [:index]
        resources :main_shops, only: [:index]
      end
      namespace :all do
        resources :stations, only: [:index]
        resources :shops, only: [:index]
        resources :cities, only: [:index]
      end
    end
  end
  get "*anything" => "api/v1/base#rescue_404"
end
