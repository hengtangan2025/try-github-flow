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
  validate :member_and_teams_must_belong_to_the_same_company

  belongs_to :company
  has_and_belongs_to_many :teams

  def member_and_teams_must_belong_to_the_same_company
    standard = self.company_id
    self.team_ids.each do |t|
      if Team.find(t).company_id != standard
        errors.add(:base,"member and teams not  belong to the same company")
      end
    end
  end
end