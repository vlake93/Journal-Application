class HomeController < ApplicationController
  def index
    @category = current_user.category.all
  end

  def indextwo
    @task = category.task.all
  end
end
