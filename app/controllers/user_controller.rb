class UserController < ApplicationController
  def new
  end

  def create
    @sfz = params[:sfz]
    @name = params[:name]
    @user = User.new(:sfz => @sfz, :name => @name)
    
    # @user = User.create(:sfz => @sfz, :name => @name, :tel => '14725836900', :address => 'qazwsxedcrfv')
    if @user.save
      redirect_to user_continue_path(:user_id => @user.id)
    else
      redirect_to user_new_path 
    end
  end

  def continue
  end

  def success 
  end

  def update
    @tel = params[:tel]
    @address = params[:address]
    @user_id = params[:user_id]
    @user = User.where(:id => @user_id).first
    if @user.update(:address => @address, :tel => @tel)
      redirect_to user_success_path
    else
      redirect_to user_continue_path(:user_id => @user_id) 
    end    
  end
end