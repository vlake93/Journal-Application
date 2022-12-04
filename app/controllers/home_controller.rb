class HomeController < ApplicationController
  def index
    @category = current_user.category.all
  end
end
