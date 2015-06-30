class User < ActiveRecord::Base

  # Extract user info from Twitter, if user doesn't already exist, create it
  # Also checks to see if token stored in database is still valid/updates if not
  def self.from_omniauth(auth_hash)
    user = User.where(uid: auth_hash["uid"]).first
    if user
      unless auth_hash["credentials"]["token"] == user.token
        user.update_attributes(token: auth_hash["credentials"]["token"], token_secret: auth_hash["credentials"]["secret"])
      end
      user
    else
      create_from_omniauth(auth_hash)
    end
  end

  def self.create_from_omniauth(auth_hash)
    create! do |user|
      user.provider = auth_hash["provider"]
      user.uid = auth_hash["uid"]
      user.name = auth_hash["info"]["nickname"]
      user.token = auth_hash["credentials"]["token"]
      user.token_secret = auth_hash["credentials"]["secret"]
    end
  end
end
