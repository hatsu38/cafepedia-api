require 'rails_helper'

describe 'Api::MainShopsController', type: :request do
  describe 'Get Index' do
    let!(:main_shop) { create(:main_shop) }

    before do
      get api_main_shops_path
    end

    it '200' do
      expect(response.status).to eq 200
    end

    it 'コメント内容を取得' do
      json = JSON.parse(response.body)
      expect(json['main_shops'][0]['id']).to eq(main_shop.id)
    end
  end
end
