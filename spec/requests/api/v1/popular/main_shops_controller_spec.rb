require 'rails_helper'

describe Api::V1::Popular::MainShopsController, type: :request do
  describe 'Get Index' do
    let(:main_shop) { main_shops(:test_main_shop_with_many_shops) }

    it '200' do
      get api_v1_popular_main_shops_path
      expect(response.status).to eq 200
    end
  end
end
