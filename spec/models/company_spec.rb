require 'rails_helper'

RSpec.describe Company, type: :model do
  it "测试公司字段完全通过校验" do
    company = Company.new(:name => "lykj", :address => "jinqiuguojidasha904")
    expect(company).to be_valid
  end

  it "测试公司名称不合法" do
    company = Company.new(:name => "l", :address => "jinqiuguojidasha904")
    expect(company).not_to be_valid
  end

  it "测试公司地址不合法" do
    company = Company.new(:name => "lykj", :address => "904")
    expect(company).not_to be_valid
  end
end
