class CategoryController < ApplicationController
  def index
    @category = current_user.category.all
  end

  def new
    @category = current_user.category.new
  end

  def create
    @category = current_user.category.create(category_params)

    if @category.save
      redirect_to unauthenticated_root_path
    else
      render :new
    end
  end

  def show
    @category = current_user.category.find(params[:id])
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
    @category = current_user.category.find(params[:user_id])
  end

  def category_params
    params.require(:category).permit(:name, :details, :user_id, :id)
  end

  def task
    @task = task.find(params[:category_id])
  end
end
