require 'rails_helper'

describe Api::CommentsController, type: :request do
  describe 'Get Index' do
    let!(:comment) { create(:comment) }

    before do
      get api_shop_comments_path(shop_id: comment.shop.id)
    end

    it '200' do
      expect(response.status).to eq 200
    end

    it 'コメント内容を取得' do
      json = JSON.parse(response.body)
      expect(json['comments'][0]['content']).to eq(comment.content)
    end
  end

  describe 'Post Create' do
    let!(:shop) { create(:shop) }
    let!(:params) do
      {
        comment: attributes_for(
          :comment,
          shop_id: shop.id,
          name: '名無しさん',
          content: 'コメント内容'
        )
      }
    end

    it '200' do
      expect do
        post api_shop_comments_path(shop_id: shop.id, params: params)
      end.to change(Comment, :count).by(1)
    end
  end
end
