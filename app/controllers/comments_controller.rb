class CommentsController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
    @comment = Comment.new
  end

  def create
    job = Job.find(params[:job_id])
    @comment = Comment.new(body: params[:comment][:body], job_id: job.id)
    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to company_job_path(job.company, job)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
