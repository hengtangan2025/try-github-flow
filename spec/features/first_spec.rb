require 'rails_helper'

describe "the signin process", :type => :feature do

  it "录入信息" do
    @shen_fen_zheng = '332526199306269857'
    @name           = 'bob'
    @tel            = '14725836900'
    @address        = 'qazwsxedcfgybgh'

    visit '/users/new'

    within("#session") do
      fill_in 'user[shen_fen_zheng]', :with => @shen_fen_zheng
      fill_in 'user[name]', :with => 'bob'
    end
    click_button 'Next'

    within("#continue") do
      fill_in 'user[tel]', :with => '14725836900'
      fill_in 'user[address]', :with => 'qazwsxedcfgybgh'
    end
    click_button 'Next'

    expect(page).to have_content 'Success'

    user = User.where(:shen_fen_zheng => @shen_fen_zheng).first
    expect(user.name).to eq(@name)
    expect(user.tel).to eq(@tel)
    expect(user.address).to eq(@address)
  end

  it "身份证录入错误" do
    expect{
      visit '/users/new'

      within("#session") do
        fill_in 'user[shen_fen_zheng]', :with => '33252619930626985'
        fill_in 'user[name]', :with => 'bob'
      end
      click_button 'Next'

      expect(page).to have_css "#session"

    }.to change{User.count}.by(0)

  end

  it "姓名录入错误" do
    expect{
      visit '/users/new'

      within("#session") do
        fill_in 'user[shen_fen_zheng]', :with => '332526199306269855'
        fill_in 'user[name]', :with => 'bobqaz'
      end
      click_button 'Next'

      expect(page).to have_css "#session"
    }.to change{User.count}.by(0)

  end

  it "手机号录入错误" do
    @shen_fen_zheng = '332526199306269789'
    @name           = 'bob'
    @tel            = '1472583'
    @address        = 'qazwsxedcfgybgh'

    visit '/users/new'

    within("#session") do
      fill_in 'user[shen_fen_zheng]', :with => @shen_fen_zheng
      fill_in 'user[name]', :with => @name
    end
    click_button 'Next'


    within("#continue") do
      fill_in 'user[tel]', :with => @tel
      fill_in 'user[address]', :with => @address
    end
    click_button 'Next'

    expect(page).to have_css "#continue"

    user = User.where(:shen_fen_zheng => @shen_fen_zheng).first
    expect(user.name).to eq(@name)
    expect(user.tel).to eq(nil)
    expect(user.address).to eq(nil)
  end

  it "地址录入错误" do
    @shen_fen_zheng = '332526199306269123'
    @name           = 'bob'
    @tel            = '14725836900'
    @address        = 'qazws'

    visit '/users/new'

    within("#session") do
      fill_in 'user[shen_fen_zheng]', :with => @shen_fen_zheng
      fill_in 'user[name]', :with => @name
    end
    click_button 'Next'


    within("#continue") do
      fill_in 'user[tel]', :with => @tel
      fill_in 'user[address]', :with => @address
    end
    click_button 'Next'

    expect(page).to have_css "#continue"

    user = User.where(:shen_fen_zheng => @shen_fen_zheng).first
    expect(user.name).to eq(@name)
    expect(user.tel).to eq(nil)
    expect(user.address).to eq(nil)
  end

  it "增加公司信息" do
    expect{
      @name    = 'gndf'
      @address = 'jinqiuguojidasha904'
      visit "/companies"

      click_button '添加信息'

      within("#new") do
        fill_in 'company[name]', :with => @name
        fill_in 'company[address]', :with => @address
      end
      click_button '确定'
    }.to change{Company.count}.by(1)
  end

  it "删除公司信息" do
    expect{
      visit "/companies"

      within("#company_list") do
        click_button '删除'
      end

      expect(page).to have_css "#company_list"
    }.to change{Company.count}.by(-1)
  end

  # it "修改公司信息" do 
  #   @id     = '55cc0b7664656210c2000000'
  #   @name   = "weiruan"
  #   @addess = "jialifuniyaluoshanji"

  #   visit "/companies"
  #   p 1111111

  #   first(".list_action").click_button('修改信息') 

  #   within("#edit") do
  #     fill_in 'company[name]', :with => @name
  #     fill_in 'company[address]', :with => @address
  #   end

  #   click_button '确定'

  #   expect(page).to have_css "#company_list"

  #   company = Company.find(:id => @id)
  #   expect(company.name).to eq(@name)
  #   expect(company.address).to eq(@address)
  # end
end
