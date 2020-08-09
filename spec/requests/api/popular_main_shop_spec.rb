require 'rails_helper'

describe 'Api::PopularMainShopsController', type: :request do
  describe 'Get Index' do
    before do
      get api_popular_main_shops_path
    end

    it '200' do
      expect(response.status).to eq 200
    end
  end
end
