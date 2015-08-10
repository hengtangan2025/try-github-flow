require 'rails_helper'

RSpec.describe User, type: :model do
  it "1" do
    user = User.new(:sfz => '123456789123456789', :name => 'bob', :tel => 14725836900, :address => 'zssfgfrggfgf')
    expect(user).to be_valid
  end
end
