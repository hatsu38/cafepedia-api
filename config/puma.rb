# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#
port        ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
#
environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked web server processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

# Worker Killer 設定
# インフラ構成やインスタンスサイズを変更した場合は必ず見直すこと
if ENV["ENABLE_WORKER_KILLER"] == "true"
  before_fork do
    require "puma_worker_killer"

    PumaWorkerKiller.config do |config|
      config.ram           = (ENV["WORKER_KILLER_RAM_SIZE"] || 4096) # mb
      config.frequency     = 5    # seconds
      config.percent_usage = (ENV["WORKER_KILLER_PERCENT_USAGE"] || 0.98) # percent
      config.rolling_restart_frequency = 12 * 3600 # 12 hours in seconds
      config.reaper_status_logs = true
    end
    PumaWorkerKiller.start
  end
end