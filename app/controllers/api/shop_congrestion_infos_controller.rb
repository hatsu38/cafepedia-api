# frozen_string_literal: true

module Api
  class ShopCongrestionInfosController < ApplicationController
    def destroy
      shop_congrestion_info = ShopCongrestionInfo.find_by(id: params[:id])
      if shop_congrestion_info && shop_congrestion_info.destroy
        render json: { status: 'ok'}
      else
        Rails.logger.error("id: #{shop_congrestion_info} の混雑情報の投稿の削除に失敗しました")
      end
    end
  end
end
