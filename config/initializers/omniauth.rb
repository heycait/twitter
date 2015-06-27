OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "WfLCBqb41OjVEGy42s5V54ivt", "3dcJA2ZV5Q245C8eMwHji6Sx5aw2TkEKYS4DovCsgfwMm4CZLy"
end

