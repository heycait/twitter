OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "s3qkkBItHQVPF2UQQ3VNw9ffj", "ho4z121TAzPGoqCTkdtlpDqg3BGdfmcjpWZvcqUupSKFQpWb6c"
end