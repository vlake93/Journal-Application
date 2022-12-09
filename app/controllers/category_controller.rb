class CategoryController < ApplicationController
  before_action :get_category, only: %i[show edit update destroy]

  def index
    @category = current_user.categories.all
  
  end

  def new
    @category = current_user.categories.new
  end

  def create
    @category = current_user.categories.create(category_params)

    if @category.save
      redirect_to unauthenticated_root_path,  notice: "Category was successfully created."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
     redirect_to unauthenticated_root_path, notice: "Category was successfully updated."
    else
      render :edit
    end
  end

def destroy
  @category.destroy
  redirect_to unauthenticated_root_path, notice: "Category was successfully deleted." 
end

  private

  def get_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :details, :user_id, :id)
  end

  def task
    @task = task.find(params[:category_id])
  end
end
