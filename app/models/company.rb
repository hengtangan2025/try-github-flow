class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :address, type: String

  validates :name, length: {in: 2..20}
  validates :address, length: {in: 10..20}

  has_many :teams 
  has_many :members
end