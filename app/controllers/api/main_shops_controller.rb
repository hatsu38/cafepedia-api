# frozen_string_literal: true

module Api
  class MainShopsController < ApplicationController
    PER = 20
    def index
      @main_shops = MainShop.eager_load(:shops)
    end

    def show
      @main_shop = MainShop.find(params[:id])
      @shops = @main_shop.shops.open.page(params[:page]).per(params[:per] || PER)
    end
  end
end
