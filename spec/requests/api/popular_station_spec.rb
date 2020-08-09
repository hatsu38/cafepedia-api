require 'rails_helper'

describe 'Api::PopularStationsController', type: :request do
  describe 'Get Index' do
    let!(:main_shop) { create(:main_shop) }

    it '200' do
      get api_popular_stations_path
      expect(response.status).to eq 200
    end


    it 'get id' do
      json = JSON.parse(response.body)
      expect(json['main_shops'][0]['id']).to eq(main_shop.id)
    end
  end
end
