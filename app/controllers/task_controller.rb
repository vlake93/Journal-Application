class TaskController < ApplicationController
  def index
    @task = category.tasks.all
  end

  def new
    @task = category.tasks.new
  end

  def create
    @task = category.tasks.create(task_params)

    if @task.save
      redirect_to unauthenticated_root_path
    else
      render :new
    end
  end

  def show
    @task = category.tasks.find(params[:id])
  end

  private

  def category
    Category.find(params[:category_id])
  end

  def get_task
    @task = tasks.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:name, :details, :category_id, :id, :date)
  end
end
