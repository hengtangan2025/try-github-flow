class CompaniesController < ActionController::Base
  def index
    @companies = Company.all
  end

  def show
  end
end