class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @jobs = Job.where(:is_hidden => false).order("created_at DESC")
    @jobs = case params[:order]
    when "by_lower_bound"
      Job.where(:is_hidden => false).order("wage_lower_bound DESC").paginate(:page => params[:page], :per_page => 10)
    when "by_upper_bound"
      Job.where(is_hidden: false).order("wage_upper_bound DESC").paginate(:page => params[:page], :per_page => 10)
    else
      Job.where(is_hidden: false).order("created_at DESC")
    end.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = "Update successfully."
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "Job deleted."
    redirect_to jobs_path
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden)
  end

end
