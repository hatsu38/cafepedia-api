require 'rails_helper'

RSpec.describe Api::V1::Search::KeywordsController, type: :request do
  describe 'Get Index' do
    it '200' do
      get api_v1_search_keywords_path
      expect(response).to have_http_status(:success)
    end
  end
end
