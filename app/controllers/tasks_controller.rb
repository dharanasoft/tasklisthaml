class TasksController < ApplicationController
  before_filter :authenticate_user!
  def index
    @bucket = Bucket.find(params[:bucket_id])
    @pending = @bucket.tasks.pending
  end
  def completed
    @bucket = Bucket.find(params[:bucket_id])
    @completed = @bucket.tasks.completed
  end
  def new
    @bucket = Bucket.find(params[:bucket_id])
    @task = @bucket.tasks.build
  end
  def create
    @bucket = Bucket.find(params[:bucket_id])
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
    @task.complete
    flash[:notice]="Task marked as done"
    redirect_to bucket_tasks_path(@task.bucket)
  end

end
