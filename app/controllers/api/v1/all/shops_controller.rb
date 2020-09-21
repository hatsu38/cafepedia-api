module Api
  module V1
    module All
      class ShopsController < ApplicationController
        def index
          @shops = Shop.all.where.not(city_id: nil)
        end
      end
    end
  end
end