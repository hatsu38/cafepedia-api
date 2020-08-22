module Api
  module V1
    module Popular
      class MainShopsController < ApplicationController
        PER = 50
        def index
          @main_shops = MainShop.popular.eager_load(:shops).page(params[:page]).per(params[:per] || PER)
        end
      end
    end
  end
end
