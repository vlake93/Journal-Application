class HomeController < ApplicationController
  def index
    @category = current_user.categories
    # @task = @category.tasks
  end
end
