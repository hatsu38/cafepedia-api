require 'rails_helper'

describe 'Api::StationsController', type: :request do
  describe 'Get Index' do
    it '200' do
      get api_stations_path
      expect(response.status).to eq 200
    end
  end

  describe 'Get Show' do
    let!(:station) { create(:station) }

    it '200' do
      get api_station_path(station)
      expect(response.status).to eq 200
    end
  end
end
