Sentry.init do |config|
  config.environment = %w[development staging production]
  config.send_default_pii = true
  config.dsn = Rails.application.credentials.sentry_dsn
end