require 'rails_helper'

describe 'Api::SearchShopsController', type: :request do
  describe 'Get Search' do
    let!(:shop) { create(:shop) }

    before { get api_search_shops_path(station_name: '徒歩') }

    it '200' do
      expect(response.status).to eq 200
    end

    it '店名を取得' do
      json = JSON.parse(response.body)
      expect(json['shops'][0]['name']).to eq(shop.name)
    end
  end
end
