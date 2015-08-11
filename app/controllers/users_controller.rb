class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_init_params)
    if @user.save
      redirect_to "/users/#{@user.id}/continue"
    else
      redirect_to "/users/new"
    end
  end

  def continue
    @user = User.find(params[:id])
  end

  def success
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_complete_params)
      redirect_to "/users/success"
    else
      redirect_to "/users/#{params[:id]}/continue"
    end
  end


  private
  def user_init_params
    params.require(:user).permit(:name, :shen_fen_zheng)
  end

  def user_complete_params
    params.require(:user).permit(:tel, :address)
  end
end
