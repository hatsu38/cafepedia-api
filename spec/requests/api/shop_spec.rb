require 'rails_helper'

describe Api::ShopsController, type: :request do
  describe 'Get Index' do
    let!(:shop) { create(:shop) }

    it '200' do
      get api_shops_path
      expect(response.status).to eq 200
    end

    it '店名を取得' do
      get api_shops_path
      json = JSON.parse(response.body)
      expect(json['shops'][0]['name']).to eq(shop.name)
    end
  end

  describe 'Get Show' do
    let!(:shop) { create(:shop) }

    it '200' do
      get api_shop_path(shop)
      expect(response.status).to eq 200
    end

    it '店名を取得' do
      get api_shop_path(shop)
      json = JSON.parse(response.body)
      expect(json['shop']['name']).to eq(shop.name)
    end
  end

  describe 'Get Search' do
    let!(:shop) { create(:shop) }

    it '200' do
      get api_search_path
      expect(response.status).to eq 200
    end

    it '店名を取得' do
      get api_search_path(station_name: '徒歩')
      json = JSON.parse(response.body)
      expect(json['shops'][0]['name']).to eq(shop.name)
    end
  end
end
