require 'rails_helper'

RSpec.feature "Teams", type: :feature do
  it "增加小组信息" do
    expect{
      @name      = 'gndf'
      @address   = 'jinqiuguojidasha904'
      Company.create(:name => @name, :address => @address)
      @team_name = 'tsm'
      visit "/companies"

      first(".list_action a.show").click

      within("#show") do
        click_link '查看小组信息'
      end 

      within("#team_list") do
        click_link '添加信息'
      end

      within("#team_new") do
        fill_in 'team[team_name]',    :with => @team_name
        click_button '确定'
      end

      expect(page).to have_css "#team_list"
    }.to change{Team.count}.by(1)
  end

  #先创建一个小组的信息，再将其删除
  it "删除小组信息" do
    expect{
      @name      = 'gndf'
      @address   = 'jinqiuguojidasha904'
      Company.create(:name => @name, :address => @address)
      @team_name = 'tsm'
      visit "/companies"

      first(".list_action a.show").click

      within("#show") do
        click_link '查看小组信息'
      end 

      within("#team_list") do
        click_link '添加信息'
      end

      within("#team_new") do
        fill_in 'team[team_name]',    :with => @team_name
        click_button '确定'
      end

      within("#team_list") do
        first(".list_action a.delete").click
      end

      expect(page).to have_css "#team_list"
    }.to change{Team.count}.by(0)
  end

  #先创建一个小组的信息，再点击查看
  it "查看小组信息" do
    @name      = 'gndf'
    @address   = 'jinqiuguojidasha904'
    Company.create(:name => @name, :address => @address)
    @team_name = 'tsm'
    visit "/companies"

    first(".list_action a.show").click

    within("#show") do
      click_link '查看小组信息'
    end 

    within("#team_list") do
      click_link '添加信息'
    end

    within("#team_new") do
      fill_in 'team[team_name]',    :with => @team_name
      click_button '确定'
    end

    within("#team_list") do 
      first(".list_action a.show").click
    end

    expect(page).to have_css "#team_show"
  end
  
  #先创建一个小组的信息，再将其修改
  it "修改小组信息" do
    @name      = 'gndf'
    @address   = 'jinqiuguojidasha904'
    Company.create(:name => @name, :address => @address)
    @team_name1 = 'tsm'
    @team_name2 = 'ssw'
    visit "/companies"

    first(".list_action a.show").click

    within("#show") do
      click_link '查看小组信息'
    end 

    within("#team_list") do
      click_link '添加信息'
    end

    within("#team_new") do
      fill_in 'team[team_name]',    :with => @team_name1
      click_button '确定'
    end

    within("#team_list") do 
      first(".list_action a.update").click
    end

    within("#team_edit") do
      fill_in 'team[team_name]',    :with => @team_name2
      click_button '确定'
    end

    expect(page).to have_css "#team_list"
  end

end
