if ENV["SECRET_KEY_BASE"].present?
  Rails.application.config.secret_key_base = ENV["SECRET_KEY_BASE"]
else 
  Rails.application.config.secret_key_base = SecureRandom.hex(64)
end