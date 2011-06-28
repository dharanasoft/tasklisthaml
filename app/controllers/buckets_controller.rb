class BucketsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @buckets = current_user.buckets
  end
  def new
    @bucket = Bucket.new
  end
  def create
    @bucket = Bucket.new(params[:bucket])
    @bucket.user = current_user
    if(@bucket.save)
      redirect_to buckets_path, :notice=>"Bucket created successfully"
    else
      render :action=>:new
    end
  end
end
