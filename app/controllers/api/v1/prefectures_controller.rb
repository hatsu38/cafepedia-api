module Api
  module V1
    class PrefecturesController < ApplicationController
      PER = 10
      def index
        @prefectures = Prefecture.all
      end

      def show
        @prefecture = Prefecture.find_by(name_e: params[:name_e])
        @cities = @prefecture.cities
        @shops = @prefecture.shops.open.page(params[:page]).per(params[:per] || PER)
      end
    end
  end
end