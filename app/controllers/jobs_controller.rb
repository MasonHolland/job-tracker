class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = Contact.new
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    company = Company.find(params[:company_id])
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(company, @job.id)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find_by(id: params[:id], company_id: params[:company_id])
    company = Company.find(params[:company_id])
    job.destroy
    flash[:success] = "#{company.name}'s #{job.title} posting was successfully deleted!"
    redirect_to company_jobs_path(company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
