class MembersController < ApplicationController
  def index
    @company_id = params[:company_id]
    @members = Member.all
  end

  def new
    @company = Company.find(params[:company_id])
    @company_id = params[:company_id]
    @member = Member.new
  end

  def show
    @company_id = params[:company_id]
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
    @company_id = params[:company_id]
    @company = Company.find(params[:company_id])
  end

  def create
    @company_id = params[:company_id]
    @member = Member.new(member_params)
    if @member.save 
      redirect_to "/companies/#{@company_id}/members"
    else
      redirect_to "/companies/#{@company_id}/members/new"
    end
  end

  def update
    @company = Company.find(params[:company_id])
    @company_id = params[:company_id]
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to "/companies/#{@company_id}/members"
  end

  def destroy
    @company_id = params[:company_id]
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to "/companies/#{@company_id}/members"
  end

  private
    def member_params
      params.require(:member).permit(:shen_fen_zheng, :name, :tel)
    end

end