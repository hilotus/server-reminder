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

  scope :by_token, ->(token){ where(:id => token).without(:password) }
  scope :by_hash, ->(hash){ where(hash).without(:password) }
  scope :by_login, ->(username, password){
    where(:username => username, :password => password).without(:password)
  }
end