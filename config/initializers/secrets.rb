if ENV["SECRET_KEY"].present?
  Rails.application.config.secret_key = ENV["SECRET_KEY"]
else 
  Rails.application.config.secret_key = SecureRandom.hex(64)
end