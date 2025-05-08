require 'redis'

begin
  if ENV['KUBERNETES_SERVICE_HOST'].present?
    # In Kubernetes, use the provided REDIS_URL which should point to the service
    url = ENV.fetch('REDIS_URL')
    $redis = Redis.new(url: url)
    Rails.logger.info "Connected to Redis in Kubernetes at #{url}"
  else
    # For local development, use host and port
    redis_host = ENV.fetch('REDIS_HOST', 'localhost')
    redis_port = ENV.fetch('REDIS_PORT', '6379')
    $redis = Redis.new(host: redis_host, port: redis_port)
    Rails.logger.info "Connected to Redis locally at #{redis_host}:#{redis_port}"
  end
  
  # Test connection
  $redis.ping
rescue Redis::CannotConnectError => e
  Rails.logger.error "Failed to connect to Redis: #{e.message}"
  # You can use a null Redis implementation for development if needed
  $redis = Redis.new(driver: :ruby) if Rails.env.development?
end