require 'rails_helper'

describe Api::V1::Search::KeywordsController, type: :request do
  describe 'Get Index' do
    let(:shop) { shops(:test_shop) }

    it '200' do
      get api_v1_search_keywords_path, params: { keyword: shop.name }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['shops'].first['id']).to eq(shop.id)
    end
  end
end
