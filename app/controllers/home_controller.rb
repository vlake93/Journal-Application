class HomeController < ApplicationController
  def index
    @categories = current_user.categories
    # @task = @category.tasks
  end
end
