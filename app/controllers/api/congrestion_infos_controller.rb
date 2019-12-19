# frozen_string_literal: true

module Api
  class CongrestionInfosController < ApplicationController
    def create
      shop = Shop.find_by(id: params[:shop_id])
      info = CongrestionInfo.find_by(id: params[:congrestion_infos][:id])
      ShopCongrestionInfo.create!(shop: shop, congrestion_info: info)
    end
  end
end
