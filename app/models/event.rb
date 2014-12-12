class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user, type: String
  field :title, type: String
  field :description, type: String
  field :datetime, type: String

  # TODO: event add type field

  scope :by_hash, ->(hash){ where(hash) }
end