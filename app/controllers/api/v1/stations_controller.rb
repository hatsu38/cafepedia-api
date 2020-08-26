module Api
  module V1
    class StationsController < ApplicationController
      PER = 20
      def show
        @station = Station.find_by(id: params[:id])
        @shops = @station.shops.open.page(params[:page]).per(params[:per] || PER)
      end
    end
  end
end
