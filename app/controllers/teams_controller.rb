class TeamsController < ApplicationController
  before_action :find_company
  def index
    @teams = @company.teams.all
  end

  def show
    @team = @company.teams.find(params[:id])
  end

  def new
    @team = @company.teams.new
  end

  def edit
    @team = @company.teams.find(params[:id])
  end

  def create
    @team = @company.teams.new(team_params)
    if @team.save
      redirect_to "/companies/#{@company_id}/teams"
    else
      redirect_to "/companies/#{@company_id}/teams/new"
    end
  end

  def update
    @team = @company.teams.find(params[:id])
    @team.update(team_params)
    redirect_to "/companies/#{@company_id}/teams"
  end 

  def destroy
    @team = @company.teams.find(params[:id])
    @team.destroy
    redirect_to "/companies/#{@company_id}/teams"
  end

  private
    def find_company
      @company = Company.find(params[:company_id])
      @company_id = params[:company_id]
    end

    def team_params
      params.require(:team).permit(:team_name)
    end
end