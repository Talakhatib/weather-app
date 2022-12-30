Sidekiq.configure_client do |config|
    config.redis = { url: "redis://redis:6379/0", size: 4, network_timeout: 5 }
  end
  
  Sidekiq.configure_server do |config|
    config.redis = { url: "redis://redis:6379/0", size: 4, network_timeout: 5 }
  end