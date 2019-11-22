# frozen_string_literal: true

module Api
  class CommentsController < ApplicationController
    protect_from_forgery except: [:create]
    PER = 3
    def index
      shop = Shop.find_by(id: params[:shop_id])
      @comments = shop.presence ? shop.comments.order(id: :desc).page(params[:page]).per(PER) : nil
    end

    def create
      Comment.create!(create_params)
    end

    private

    def create_params
      params.require(:comment).permit(:name, :content, :is_complete, :shop_id)
    end
  end
end
