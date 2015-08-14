class Member
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :shen_fen_zheng, type: String
  field :tel, type: String

  validates :name, length: {in: 2..4}
  validates :shen_fen_zheng,
    length: {is: 18},
    format: { with: %r{\d[0-9]}, messgae: "身份证号必须是 18 位数字"}
  validates :tel, 
    length: {is: 11},
    format: { with: %r{\d[0-9]}, message: "手机号必须是 11 为数字"}

  belongs_to :company
  has_and_belongs_to_many :teams
end