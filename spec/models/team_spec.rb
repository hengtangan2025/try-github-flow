require 'rails_helper'

RSpec.describe Team, type: :model do
  it "测试小组字段完全通过校验" do
    team = Team.new(:team_name => "zhujian")
    expect(team).to be_valid
  end

  it "测试小组名称不合法" do
    team = Team.new(:team_name => "z")
    expect(team).not_to be_valid
  end
end
