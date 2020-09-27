module Api
  module V1
    class HealthCheckController < BaseController
      def index
        render json: { status: 'ok' }
      end
    end
  end
end