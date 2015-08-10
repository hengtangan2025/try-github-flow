class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :sfz, type: String
  field :name, type: String
  field :tel, type: String
  field :address, type: String
  field :is_vip,type: Boolean

  validates :sfz, 
    :format => { with: %r{\d[0-9]}, :message => "身份证号必须是 18 位数字"}, 
    length: { is: 18 }, 
    uniqueness: true, 
    presence: true
  validates :name, 
    length: { in: 2..4 }, 
    presence: true
# if Proc.new{|m| !m.tel.blank?}
  validates :tel, :format => { with: %r{\d[0-9]}, :message => "手机号必须是 11 为数字"},  length: { is: 11 },
    :if => Proc.new{|m| !m.tel.blank?}
# end
# if Proc.new{|m| !m.address.blank?}
  validates :address, length: { in: 10..50 },
    :if => Proc.new{|m| !m.address.blank?}
# end
  has_many :orders
end
