describe "the signin process", :type => :feature do
  it "创建新用户" do
    @user = User.create!(:sfz => 123456789123456789, :name => 'bob', :tel => '12345678900', :address => 'qazwsxedcrfv')
    @user.valid?
  end

  it "录入信息" do
    visit '/user/new'

    within("#session") do
      fill_in 'sfz', :with => '332526199306269857'
      fill_in 'name', :with => 'bob'
    end
    click_button 'Next'

    within("#continue") do
      fill_in 'tel', :with => '14725836900'
      fill_in 'address', :with => 'qazwsxedcfgybgh'
    end
    click_button 'Next'

    expect(page).to have_content 'Success'
  end

  it "身份证录入错误" do
    visit '/user/new'

    within("#session") do
      fill_in 'sfz', :with => '33252619930626985'
      fill_in 'name', :with => 'bob'
    end
    click_button 'Next'

    expect(page).to have_css "#session"
  end

  it "姓名录入错误" do
    visit '/user/new'

    within("#session") do
      fill_in 'sfz', :with => '332526199306269855'
      fill_in 'name', :with => 'bobqaz'
    end
    click_button 'Next'

    expect(page).to have_css "#session"
  end

  it "手机号录入错误" do
    visit '/user/new'

    within("#session") do
      fill_in 'sfz', :with => '332526199306269789'
      fill_in 'name', :with => 'bob'
    end
    click_button 'Next'
    

    within("#continue") do
      fill_in 'tel', :with => '1472583'
      fill_in 'address', :with => 'qazwsxedcfgybgh'
    end
    click_button 'Next'

    expect(page).to have_css "#continue"
  end

  it "手机号录入错误" do
    visit '/user/new'

    within("#session") do
      fill_in 'sfz', :with => '332526199306269123'
      fill_in 'name', :with => 'bob'
    end
    click_button 'Next'
    

    within("#continue") do
      fill_in 'tel', :with => '14725836900'
      fill_in 'address', :with => 'qazws'
    end
    click_button 'Next'

    expect(page).to have_css "#continue"
  end
end
