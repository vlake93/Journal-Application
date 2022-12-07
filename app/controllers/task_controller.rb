class TaskController < ApplicationController
  before_action :get_category
  before_action :get_task, only: %i[show edit update destroy]

  def index
    @task = @category.tasks.all
  end

  def new
    @task = @category.tasks.new
  end

  def create
    @task = @category.tasks.create(task_params)

    if @task.save
      redirect_to user_category_path(current_user, @category, @task)
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
      redirect_to user_category_path(current_user, @category, @task), notice: "Task was successfully updated."
    else
      render :edit
    end
  end

def destroy
  @task.destroy
  redirect_to user_category_path(current_user, @category, @task), notice: "Task was successfully deleted." 
end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end

  def get_task
    @task = @category.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :details, :date)
  end
end
