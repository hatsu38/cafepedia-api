module Api
  module V1
    module All
      class CitiesController < ApplicationController
        def index
          @cities = City.all
        end
      end
    end
  end
end