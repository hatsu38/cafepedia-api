require 'rails_helper'

describe Api::V1::Prefectures::CitiesController, type: :request do
  let(:shop) { shops(:test_shop) }

  describe 'Get Index' do
    it '200' do
      get api_v1_prefecture_cities_path(prefecture_name_e: shop.prefecture_name_e)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Get Show' do
    it '200' do
      get api_v1_prefecture_city_path(prefecture_name_e: shop.prefecture_name_e, code: shop.city_code)
      expect(response).to have_http_status(:success)
    end
  end
end
