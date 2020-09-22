module Api
  module V1
    class BaseController < ApplicationController

      if Rails.env.production? || Rails.env.staging?
        rescue_from StandardError, with: :rescue_500
        rescue_from ActionController::RoutingError, with: :rescue_404
        rescue_from ActiveRecord::RecordNotFound, with: :rescue_404
        rescue_from ActionController::UnknownFormat, with: :rescue_404
        rescue_from ActionView::MissingTemplate, with: :rescue_404
        rescue_from ActiveHash::RecordNotFound, with: :rescue_404
      end

      def rescue_404(e = nil)
        Rails.logger.warn(
          "message: 404 NotFound #{request.url},
          #{e&.message},
          #{e&.class}"
        )
        Raven.extra_context(params: params&.to_unsafe_h, url: request.url)
        render json: { message: "not found", status: 404 }
      end

      def rescue_500(e = nil)
        Rails.logger.error(
          "message: 500 InternalError #{request.url},
          #{e&.message},
          #{e&.class}"
        )
        Raven.extra_context(params: params&.to_unsafe_h, url: request.url)
        render json: { message: "internal error", status: 500 }
      end
    end
  end
end