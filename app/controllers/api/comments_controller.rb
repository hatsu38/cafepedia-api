class Api::CommentsController < ApplicationController
  protect_from_forgery except: [:create]
  def index
    shop = Shop.find_by(id: params[:shop_id])
    @comments = shop.presence ? shop.comments.page(params[:page]) : nil
  end

  def create
    Comment.create!(create_params)
  end

  private

  def create_params
    params.require(:comment).permit(:name, :content, :is_complete, :shop_id)
  end
end
