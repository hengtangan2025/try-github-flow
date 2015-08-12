require 'rails_helper'

RSpec.describe Member, type: :model do
  it "测试职员字段完全通过校验" do
    member = Member.new(:name => "zsf", :shen_fen_zheng => 123456789123456789, :tel => 15987423600)
    expect(member).to be_valid
  end

  it "测试职员姓名不合法" do
    member = Member.new(:name => "z", :shen_fen_zheng => 123456789123456789, :tel => 15987423600)
    expect(member).not_to be_valid
  end

  it "测试职员身份证不合法" do
    member = Member.new(:name => "zsf", :shen_fen_zheng => 12345678912345678, :tel => 15987423600)
    expect(member).not_to be_valid
  end
  
  it "测试职员手机号不合法" do
    member = Member.new(:name => "zsf", :shen_fen_zheng => 123456789123456789, :tel => 5987423600)
    expect(member).not_to be_valid
  end
end
