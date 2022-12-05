class HomeController < ApplicationController
  def index
    @category = current_user.categories.all
  end
end
