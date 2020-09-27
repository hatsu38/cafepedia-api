require 'rails_helper'

RSpec.describe Api::V1::Prefectures::Cities::MainShops::ShopsController, type: :request do
  let(:shop) { create(:shop) }
  describe 'Get Index' do
    it '200' do
      get api_v1_prefecture_city_main_shop_shop_path(prefecture_name_e: shop.prefecture_name_e, city_code: shop.city_code, main_shop_eng_name: shop.main_shop_eng_name, id: shop.id)
      expect(response).to have_http_status(:success)
    end
  end
end
