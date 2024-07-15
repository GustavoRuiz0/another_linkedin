class CompaniesController < ApplicationController
  def options_select
    @companies = Company.select(:id, :name)

    render json: @companies
  end
end
