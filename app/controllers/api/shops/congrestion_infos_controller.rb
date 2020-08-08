# frozen_string_literal: true

module Api
  class CongrestionInfosController < ApplicationController
    def create
      shop_congrestion_info = ShopCongrestionInfo.new(
        shop_id: params[:shop_id],
        congrestion_info_id: params[:congrestion_infos][:id]
      )
      if shop_congrestion_info.save
        render json: { status: 'ok', shop_congrestion_info_id: shop_congrestion_info.id }
      else
        Rails.logger.error('混雑情報の投稿に失敗しました')
        render json: { status: 'error', shop_congrestion_info_id: nil }
      end
    end
  end
end
