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
end
