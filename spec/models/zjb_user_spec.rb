require 'rails_helper'

RSpec.describe User, type: :model do
  it "测试用户字段完全通过校验" do
    user = User.new(:shen_fen_zheng => '123456789123456789', :name => 'bob', :tel => 14725836900, :address => 'zssfgfrggfgf')
    expect(user).to be_valid
  end

end
