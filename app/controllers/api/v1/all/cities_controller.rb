module Api
  module V1
    module All
      class CitiesController < ApplicationController
        def index
          @cities = City.all.select(:id, :code, :prefecture_id)
        end
      end
    end
  end
end