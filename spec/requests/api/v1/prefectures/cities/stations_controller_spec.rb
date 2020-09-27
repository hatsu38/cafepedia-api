require 'rails_helper'

describe Api::V1::Prefectures::Cities::Stations, type: :request do
  let(:station) { create(:station) }

  describe 'Get Index' do
    it '200' do
      get api_v1_prefecture_city_station_path(
        prefecture_name_e: station.prefecture_name_e,
        city_code: station.city_code,
        id: station.id
      )
      expect(response).to have_http_status(:success)
    end
  end
end
