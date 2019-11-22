require 'rails_helper'

describe Api::StationsController, type: :request do
  describe 'Get Seach' do
    let!(:station) { create(:station) }

    it '200' do
      get api_stations_search_path(word: 'kana')
      expect(response.status).to eq 200
    end

    it '駅名を取得' do
      get api_stations_search_path(word: 'kana')
      json = JSON.parse(response.body)
      expect(json['stations'][0]['kana_name']).to eq(station.kana_name)
      expect(json['stations'][0]['kanji_name']).to eq(station.kanji_name)
    end
  end
end
