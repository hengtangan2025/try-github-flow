require 'rails_helper'

RSpec.feature "Members", type: :feature do
  describe "职员信息的增删改查" do
    it "增加职员信息" do
      expect{
        @company_name      = 'gndf'
        @address           = 'jinqiuguojidasha904'
        Company.create(:name => @company_name, :address => @address)
        @shen_fen_zheng = 332526199110114119
        @member_name    = 'kid'
        @tel            = 18004232146
        visit "/companies"

        first(".list_action a.show").click

        within("#show") do
          click_link '查看员工信息'
        end 

        within("#member_list") do
          click_link '添加信息'
        end

        within("#member_new") do
          fill_in 'member[shen_fen_zheng]', :with => @shen_fen_zheng
          fill_in 'member[name]',    :with => @member_name
          fill_in 'member[tel]',     :with => @tel
          first(".input.check_boxes.optional.member_teams span.checkbox").click
          click_button '确定'
        end
        p Member.all.first
        expect(page).to have_css "#member_list"
      }.to change{Member.count}.by(1)
    end

    #先创建一个职员的信息，再将其删除
    it "删除职员信息" do
      expect{
        @company_name      = 'gndf'
        @address           = 'jinqiuguojidasha904'
        Company.create(:name => @company_name, :address => @address)
        @shen_fen_zheng = 332526199110114119
        @member_name    = 'kid'
        @tel            = 18004232146
        visit "/companies"

        first(".list_action a.show").click

        within("#show") do
          click_link '查看员工信息'
        end 

        within("#member_list") do
          click_link '添加信息'
        end

        within("#member_new") do
          fill_in 'member[shen_fen_zheng]', :with => @shen_fen_zheng
          fill_in 'member[name]',    :with => @member_name
          fill_in 'member[tel]',     :with => @tel
          first(".input.check_boxes.optional.member_teams").click_input('tsm')
          click_button '确定'
        end

        within("#member_list") do
          first('.list_action a.delete').click
        end

        expect(page).to have_css "#member_list"
      }.to change{Member.count}.by(0)
    end

    #先创建一个职员的信息，再将其修改
    it "修改职员信息" do
      expect{
        @company_name      = 'gndf'
        @address           = 'jinqiuguojidasha904'
        Company.create(:name => @company_name, :address => @address)
        @shen_fen_zheng1 = '332526199110114119'
        @shen_fen_zheng2 = '332526199310114119'
        @member_name1    = 'kid'
        @member_name2    = 'zjb'
        @tel1            = '18004232146'
        @tel2            = '18004263246'

        visit "/companies"

        first(".list_action a.show").click

        within("#show") do
          click_link '查看员工信息'
        end 

        within("#member_list") do
          click_link '添加信息'
        end

        within("#member_new") do
          fill_in 'member[shen_fen_zheng]', :with => @shen_fen_zheng1
          fill_in 'member[name]',    :with => @member_name1
          fill_in 'member[tel]',     :with => @tel1
          click_button '确定'
        end

        within("#member_list") do
          first('.list_action a.update').click
        end

        within("#member_edit") do
          fill_in 'member[shen_fen_zheng]', :with => @shen_fen_zheng2
          fill_in 'member[name]',    :with => @member_name2
          fill_in 'member[tel]',     :with => @tel2
          click_button '确定'
        end

        expect(page).to have_css "#member_list"
      
        member = Member.all.first
        expect(member.shen_fen_zheng).to eq(@shen_fen_zheng2)
        expect(member.name).to eq(@member_name2)
        expect(member.tel).to eq(@tel2)
      }.to change{Member.count}.by(1)
    end

    #先创建一个职员的信息，再点击查看
    it "查看职员信息" do
      expect{
        @company_name      = 'gndf'
        @address           = 'jinqiuguojidasha904'
        Company.create(:name => @company_name, :address => @address)
        @shen_fen_zheng = 332526199110114119
        @member_name    = 'kid'
        @tel            = 18004232146
        visit "/companies"

        first(".list_action a.show").click

        within("#show") do
          click_link '查看员工信息'
        end 

        within("#member_list") do
          click_link '添加信息'
        end

        within("#member_new") do
          fill_in 'member[shen_fen_zheng]', :with => @shen_fen_zheng
          fill_in 'member[name]',    :with => @member_name
          fill_in 'member[tel]',     :with => @tel
          click_button '确定'
        end

        within("#member_list") do
          first('.list_action a.show').click
        end

        expect(page).to have_css "#member_show"
      }.to change{Member.count}.by(1)
    end
  end
end
