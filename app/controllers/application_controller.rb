# frozen_string_literal: true

class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: Rails.application.credentials[:basic][:user_name],
                               password: Rails.application.credentials[:basic][:password],
                               if: -> { request.path.start_with?('/admin') && !Rails.env.development? }
end