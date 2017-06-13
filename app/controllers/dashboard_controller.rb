class DashboardController < ApplicationController

  def index
    @jobs = Job.all.order(:city)
  end

  def show
    @jobs = Job.all.order(:level_of_interest)
    @companies = Job.joins(:company).group(:company).average(:level_of_interest).transform_values{|v| v.to_i}.sort_by{|k, v| v}.reverse.shift(3).to_h
  end
end
