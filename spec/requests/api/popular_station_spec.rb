require 'rails_helper'

describe 'Api::PopularStationsController', type: :request do
  describe 'Get Index' do
    it '200' do
      get api_popular_stations_path
      expect(response.status).to eq 200
    end
  end
end
