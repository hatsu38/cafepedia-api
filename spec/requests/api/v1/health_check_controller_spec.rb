require 'rails_helper'

describe Api::V1::HealthCheckController, type: :request do
  describe 'Get Index' do
    it '200' do
      get api_v1_health_check_index_path
      expect(response).to have_http_status(:success)
    end
  end
end
