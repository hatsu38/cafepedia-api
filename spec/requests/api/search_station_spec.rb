require 'rails_helper'

describe 'Api::SearchStationsController', type: :request do
  describe 'Get Index' do
    it '200 with word' do
      get api_search_stations_path(word: 'kana')
      expect(response.status).to eq 200
    end

    it '200 without word' do
      get api_search_stations_path
      expect(response.status).to eq 200
    end
  end
end
