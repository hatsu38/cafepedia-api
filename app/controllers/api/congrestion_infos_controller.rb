# frozen_string_literal: true

module Api
  class CongrestionInfosController < ApplicationController
    def create
      ShopCongrestionInfo.create!(shop_id: params[:shop_id], congrestion_info_id: params[:congrestion_infos][:id])
    end

    def destroy
      ShopCongrestionInfo.create!(shop_id: params[:shop_id], congrestion_info_id: params[:id])
    end
  end
end
