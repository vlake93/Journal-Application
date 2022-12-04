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

  private

  def get_category
    @category = Category.find(params[:user_id])
  end

  def category_params
    params.require(:category).permit(:name, :details, :user_id, :id)
  end
end
