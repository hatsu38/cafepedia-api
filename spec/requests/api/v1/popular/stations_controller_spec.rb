require 'rails_helper'

describe Api::V1::Popular::StationsController, type: :request do
  describe 'Get Index' do
    it '200' do
      get api_v1_popular_stations_path
      expect(response).to have_http_status(:success)
    end
  end
end
