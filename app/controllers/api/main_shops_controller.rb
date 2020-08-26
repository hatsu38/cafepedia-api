# frozen_string_literal: true

module Api
  class MainShopsController < ApplicationController
    PER = 20
    def index
      @main_shops = MainShop.popular
    end

    def show
      @main_shop = MainShop.find(params[:id])
      @shops = @main_shop.shops.open.page(params[:page]).per(params[:per] || PER)
    end
  end
end
