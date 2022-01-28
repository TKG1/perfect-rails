Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, "60a10a72f7ef7dc8aec7", "29c16a4eeef2b865b13bb86f4ed50b0860d4b9e2"
  else
    provider :github,
    Rails.application.credentials.github[:client_id],
    Rails.application.credentials.github[:client_secret]
  end
end
