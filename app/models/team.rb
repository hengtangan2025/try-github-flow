class Team
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  validates :name, length: {in: 2..10}

  belongs_to :company
  has_and_belongs_to_many :members
end