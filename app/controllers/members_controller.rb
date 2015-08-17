class MembersController < ApplicationController
  before_action :find_company

  def index
    @members = @company.members
  end

  def new
    @member = @company.members.new
  end

  def show
    @member = @company.members.find(params[:id])
  end

  def edit
    @member = @company.members.find(params[:id])
  end

  def create
    @member = @company.members.new(member_params)
    if @member.save 
      redirect_to "/companies/#{@company_id}/members"
    else
      redirect_to "/companies/#{@company_id}/members/new"
    end
  end

  def update
    @member = @company.members.find(params[:id])
    @member.update(member_params)
    redirect_to "/companies/#{@company_id}/members"
  end

  def destroy
    @member = @company.members.find(params[:id])
    @member.destroy
    redirect_to "/companies/#{@company_id}/members"
  end

  private
    def find_company
      @company = Company.find(params[:company_id])
      @company_id = params[:company_id]
    end

    def member_params
      params.require(:member).permit(:shen_fen_zheng, :name, :tel, :team_ids => [], :location_attributes => [:id, :name, :_destroy])
    end

end