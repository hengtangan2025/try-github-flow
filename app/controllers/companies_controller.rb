class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to "/companies"
    else
      redirect_to "/companies/new"
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    redirect_to "/companies"
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to "/companies"
  end

  private 
    def company_params
      params.require(:company).permit(:name, :address)
    end
end