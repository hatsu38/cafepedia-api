require 'rails_helper'

describe Api::ShopCongrestionInfosController, type: :request do
  describe 'Delete Shop Congrestion Info' do
    describe 'Work' do
      let!(:shop_congrestion_info) { create(:shop_congrestion_info) }
      let(:params) {{ id: shop_congrestion_info.id }}

      it 'decrement the Congrestion count' do
        expect do
          delete api_shop_congrestion_info_path(params)
        end.to change(ShopCongrestionInfo, :count).by(-1)
      end

      it 'Success Response' do
        delete api_shop_congrestion_info_path(params)
        json = JSON.parse(response.body)
        expect(json['status']).to eq('ok')
      end
    end

    describe 'Error Work' do
      let(:params) {{ id: 1}}

      it 'decrement the Congrestion count' do
        expect do
          delete api_shop_congrestion_info_path(params)
        end.to change(ShopCongrestionInfo, :count).by(0)
      end
    end
  end
end
