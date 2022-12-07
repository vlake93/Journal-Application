class TaskController < ApplicationController
  before_action :get_task, only: %i[show edit update destroy]

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
  end

  def edit
  end

  def update
    if @task.update(task_params)
     redirect_to unauthenticated_root_path, notice: "Task was successfully updated."
    else
      render :edit
    end
  end

def destroy
  @task.destroy(task_params)
  redirect_to unauthenticated_root_path, notice: "Task was successfully deleted." 
end

  private

  def category
    Category.find(params[:category_id])
  end

  def get_task
    @task = category.tasks
  end

  def task_params
    params.require(:task).permit(:name, :details, :category_id, :id, :date)
  end
end
