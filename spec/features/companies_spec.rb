require 'rails_helper'

RSpec.feature "Companies", type: :feature do
  it "增加公司信息" do
    expect{
      @name    = 'gndf'
      @address = 'jinqiuguojidasha904'
      visit "/companies"

      click_link '添加信息'

      within("#new") do
        fill_in 'company[name]',    :with => @name
        fill_in 'company[address]', :with => @address
      end
      click_button '确定'
    }.to change{Company.count}.by(1)
  end

  it "删除公司信息" do
    expect{
      @name1    = 'gndf'
      @name2    = 'ggfh'
      @address1 = 'jinqiuguojidasha904'
      @address2 = 'jinqiuguojidasha903'
      Company.create(:name => @name1, :address => @address1)
      Company.create(:name => @name2, :address => @address2)

      visit "/companies"
      first(".list_action a.delete").click

      expect(page).to have_css "#company_list"
    }.to change{Company.count}.by(1)
  end

  it "修改公司信息" do
    @name1    = 'gndf'
    @name2    = 'ggfh'
    @address1 = 'jinqiuguojidasha904'
    @address2 = 'jinqiuguojidasha903'
    company1  = Company.create(:name => @name1, :address => @address1)

    visit "/companies"

    first(".list_action a.update").click

    within("#edit") do
      fill_in 'company[name]', :with => @name2
      fill_in 'company[address]', :with => @address2
    end

    click_button '确定'

    expect(page).to have_css "#company_list"

    company = Company.find(company1.id)
    expect(company.name).to eq(@name2)
    expect(company.address).to eq(@address2)
  end

  it "查看公司信息" do
    @name    = 'ggfh'
    @address = 'jinqiuguojidasha904'
    Company.create(:name => @name, :address => @address)

    visit "/companies"

    first(".list_action a.show").click

    expect(page).to have_css "#show"
  end
end
