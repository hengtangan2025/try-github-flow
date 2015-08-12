class Team
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  validates :name, length: {in: 2..10}
end