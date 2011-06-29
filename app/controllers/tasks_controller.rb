class TasksController < ApplicationController
  before_filter :authenticate_user!
  def index
    @bucket = Bucket.find(params[:bucket_id])
    @pending = @bucket.tasks.pending
    authorize! :index, @bucket
  end
  def completed
    @bucket = Bucket.find(params[:bucket_id])
    @completed = @bucket.tasks.completed
    authorize! :completed, @bucket
  end
  def new
    @bucket = Bucket.find(params[:bucket_id])
    authorize! :new, @bucket
    @task = @bucket.tasks.build
  end
  def create
    @bucket = Bucket.find(params[:bucket_id])
    authorize! :create, @bucket
    @task = Task.new(params[:task])
    @task.user = current_user
    @task.bucket = @bucket
    if(@task.save)
      redirect_to bucket_tasks_path(@bucket), :notice=>"Task created successfully"
    else
      render :action=>:new
    end
  end
  def complete
    @task = Task.find(params[:id])
    authorize! :complete, @task
    @task.complete
    flash[:notice]="Task marked as done"
    redirect_to bucket_tasks_path(@task.bucket)
  end

end
