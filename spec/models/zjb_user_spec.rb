require 'rails_helper'

RSpec.describe User, type: :model do
  it "测试用户字段完全通过校验" do
    user = User.new(:shen_fen_zheng => '123456789123456789', :name => 'bob', :tel => 14725836900, :address => 'zssfgfrggfgf')
    expect(user).to be_valid
  end

  it "测试用户身份证不合法" do
    user = User.new(:shen_fen_zheng => '23456789123456789', :name => 'bob', :tel => 14725836900, :address => 'zssfgfrggfgf')
    expect(user).not_to be_valid
  end

  it "测试用户名字不合法" do
    user = User.new(:shen_fen_zheng => '123456789123456789', :name => '1', :tel => 14725836900, :address => 'zssfgfrggfgf')
    expect(user).not_to be_valid
  end

  it "测试用户手机号不合法" do
    user = User.new(:shen_fen_zheng => '123456789123456789', :name => 'bob', :tel => 147258369001, :address => 'zssfgfrggfgf')
    expect(user).not_to be_valid
  end

  it "测试用户地址不合法" do
    user = User.new(:shen_fen_zheng => '123456789123456789', :name => 'bob', :tel => 14725836900, :address => 'z')
    expect(user).not_to be_valid
  end

end
