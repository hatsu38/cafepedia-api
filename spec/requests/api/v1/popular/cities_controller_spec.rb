require 'rails_helper'

describe Api::V1::Popular::CitiesController, type: :request do
  describe 'Get Index' do
    it '200' do
      get api_v1_popular_cities_path
      expect(response).to have_http_status(:success)
    end
  end
end
