module Api
  module V1
    class BaseController < ApplicationController
      if Rails.env.production? || Rails.env.staging?
        rescue_from StandardError, with: :rescue_internal_error
        rescue_from ActionController::RoutingError, with: :rescue_not_found
        rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
        rescue_from ActionController::UnknownFormat, with: :rescue_not_found
        rescue_from ActionView::MissingTemplate, with: :rescue_not_found
        rescue_from ActiveHash::RecordNotFound, with: :rescue_not_found
      end

      def rescue_not_found(error = nil)
        Rails.logger.warn(
          "message: 404 NotFound #{request.url},
          #{error&.message},
          #{error&.class}"
        )
        Raven.extra_context(params: params&.to_unsafe_h, url: request.url)
        render json: { message: 'not found', status: 404 }
      end

      def rescue_internal_error(error = nil)
        Rails.logger.error(
          "message: 500 InternalError #{request.url},
          #{error&.message},
          #{error&.class}"
        )
        Raven.extra_context(params: params&.to_unsafe_h, url: request.url)
        render json: { message: 'internal error', status: 500 }
      end

      def page_params
        (params[:page] || 1).to_i
      end

      def per_params
        (params[:per] || 10).to_i
      end
    end
  end
end