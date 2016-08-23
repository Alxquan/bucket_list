class TasksController < ApplicationController
  before_action :bucket
  before_action :task, except: [:index, :new, :create]

  def index
    @tasks = @bucket.tasks
    if @tasks
      render :index
    else
      redirect_to new_bucket_task_path(@bucket)
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create

  end

  def edit
  end

  def update
    if @task.update(@task_params)
      redirect_to bucket_task_path(@bucket, @task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to bucket_path(@bucket)
  end

  private
    def task_params
      params.require(:task)
    end

    def task
      @task = @bucket.tasks.find(params[:id])
    end

    def bucket
      @bucket = Bucket.find(params[:bucket_id])
    end
end
