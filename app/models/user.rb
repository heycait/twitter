class User < ActiveRecord::Base

  # Extract user info from Twitter, if user doesn't already exist, create it
  def self.from_omniauth(auth_hash)
    where(auth_hash.slice(provider: auth_hash["provider"], uid: auth_hash["uid"], name: auth_hash["info"]["nickname"])).first || create_from_omniauth(auth_hash)
  end

  def self.create_from_omniauth(auth_hash)
    create! do |user|
      user.provider = auth_hash["provider"]
      user.uid = auth_hash["uid"]
      user.name = auth_hash["info"]["nickname"]
    end
  end
end
