require 'rails_helper'

describe 'Api::CongrestionInfosController', type: :request do
  describe 'Post Shop Congrestion Info' do
    describe 'Work' do
      let!(:shop) { create(:shop) }
      let!(:congrestion_info) { create(:congrestion_info) }
      let(:params) do
        {
          shop_id: shop.id,
          congrestion_infos: { id: congrestion_info.id }
        }
      end

      it 'increments the Congrestion count' do
        expect do
          post api_shop_congrestion_infos_path(params)
        end.to change(ShopCongrestionInfo, :count).by(1)
      end

      it 'Success Response' do
        post api_shop_congrestion_infos_path(params)
        json = JSON.parse(response.body)
        expect(json['status']).to eq('ok')
      end
    end

    describe 'Not Work' do
      let(:params) do
        {
          shop_id: 1,
          congrestion_infos: { id: 1 }
        }
      end

      it 'does not increment the Congrestion count' do
        expect do
          post api_shop_congrestion_infos_path(params)
        end.to change(ShopCongrestionInfo, :count).by(0)
      end

      it 'Error Response' do
        post api_shop_congrestion_infos_path(params)
        json = JSON.parse(response.body)
        expect(json['status']).to eq('error')
      end
    end
  end
end
