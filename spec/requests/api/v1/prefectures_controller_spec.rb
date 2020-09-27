require 'rails_helper'

describe Api::V1::Prefectures, type: :request do
  describe 'Get Index' do
    let(:shop) { create(:shop) }

    it '200' do
      get api_v1_prefectures_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Get Show' do
    let(:shop) { create(:shop) }

    it '200' do
      get api_v1_prefecture_path, params: { prefecutre_name_e: shop.prefecutre_name_e}
      expect(response).to have_http_status(:success)
    end
  end
end
