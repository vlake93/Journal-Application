class TaskController < ApplicationController
  def index
    @task = category.task.all
  end

  def new
    @task = category.task.new
  end

  def create
    @task = category.task.create(task_params)

    if @task.save
      redirect_to unauthenticated_root_path
    else
      render :new
    end
  end

  private

  def get_task
    @task = task.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:name, :details, :category_id)
  end
end
