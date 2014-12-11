class Term
  include Mongoid::Document
  include Mongoid::Timestamps

  field :color, type: String
  field :creator, type: String
  field :name, type: String
  field :type, type: String

  scope :by_hash, ->(hash){ where(hash) }
  scope :by_creator, ->(creator){ where(:creator => creator) }
end