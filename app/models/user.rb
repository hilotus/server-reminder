class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, String
  field :password, String
  field :emailVerified, Boolean, :default => false
  field :email, String
  field :locale, String
  field :name, String
  field :locked, Integer
end