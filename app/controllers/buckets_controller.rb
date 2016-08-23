class BucketsController < ApplicationController
  def index
    @buckets = Bucket.all
  end

  def show
    @bucket = Bucket.find(params[:id])
  end

  def new
    @bucket = Bucket.new
  end

  def create
    @bucket = Bucket.new(bucket_params)

    if @bucket.save
      redirect_to buckets_path
    else
      render :new
    end
  end

  private

  def bucket_params
    params.require(:bucket).permit(:title, :body)
  end
end
