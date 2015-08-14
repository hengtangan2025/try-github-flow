class TeamsController < ApplicationController
  def index
    @company_id = params[:company_id]
    @teams = Team.all
  end

  def show
    @company_id = params[:company_id]
    @team = Team.find(params[:id])
  end

  def new
    @company = Company.find(params[:company_id])
    @company_id = params[:company_id]
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
    @company_id = params[:company_id]
    @company = Company.find(params[:company_id])
  end

  def create
    @company_id = params[:company_id]
    @team = Team.new(team_params)
    if @team.save 
      redirect_to "/companies/#{@company_id}/teams"
    else
      redirect_to "/companies/#{@company_id}/teams/new"
    end
  end

  def update
    @company = Company.find(params[:company_id])
    @company_id = params[:company_id]
    @team = Team.find(params[:id])
    @team.update(team_params)
    redirect_to "/companies/#{@company_id}/teams"
  end 

  def destroy
    @company_id = params[:company_id]
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to "/companies/#{@company_id}/teams"
  end

  private
    def team_params
      params.require(:team).permit(:name)
    end
end