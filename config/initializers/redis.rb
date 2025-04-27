require 'redis'

begin
  redis_config = {
    host: Rails.configuration.redis_host,
    port: Rails.configuration.redis_port
  }
  
  # For Kubernetes with service discovery
  if ENV['KUBERNETES_SERVICE_HOST'].present?
    # Use service DNS name if in Kubernetes
    url = ENV.fetch('REDIS_URL', "redis://#{Rails.configuration.redis_host}:#{Rails.configuration.redis_port}/0")
    $redis = Redis.new(url: url)
  else
    # For local development
    $redis = Redis.new(redis_config)
  end
  
  # Test connection
  $redis.ping
  Rails.logger.info "Connected to Redis at #{Rails.configuration.redis_host}:#{Rails.configuration.redis_port}"
rescue Redis::CannotConnectError => e
  Rails.logger.error "Failed to connect to Redis: #{e.message}"
  # You can use a null Redis implementation for development if needed
  $redis = Redis.new(driver: :ruby) if Rails.env.development?
end