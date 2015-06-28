class User < ActiveRecord::Base
  include Sidekiq::Worker

  # Extract user info from Twitter, if user doesn't already exist, create it
  def self.from_omniauth(auth_hash)
    where(uid: auth_hash["uid"]).first || create_from_omniauth(auth_hash)
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
