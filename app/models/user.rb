class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :password, type: String
  field :emailVerified, type: Boolean, :default => false
  field :email, type: String
  field :locale, type: String
  field :name, type: String
  field :locked, type: Integer
  # channelId_userId
  field :token, type: String

  scope :by_user_id, ->(user_id){ where(:id => user_id).without(:password) }
  scope :by_hash, ->(hash){ where(hash).without(:password) }
  scope :by_login, ->(username, password){
    where(:username => username, :password => password).without(:password)
  }
end