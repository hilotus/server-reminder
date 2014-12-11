class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String
  field :category, type: String
  field :tags, type: Array
  field :comments, type: Array
  field :creator, type: String

  scope :by_hash, ->(hash){ where(hash) }
  scope :by_creator, ->(creator){ where(:creator => creator) }
end