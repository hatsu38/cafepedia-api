require 'rails_helper'

describe Api::V1::Popular::MainShopsController, type: :request do
  describe 'Get Index' do
    let!(:main_shop) { create(:main_shop, :with_many_shops) }

    before do
      get api_v1_popular_main_shops_path
    end

    it '200' do
      expect(response.status).to eq 200
    end
  end
end
