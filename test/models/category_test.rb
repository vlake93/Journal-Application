require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "Should not save" do
    category = Category.new
    category.name = ""
    category.details = ""
    user_id = ""
    assert_not category.save
  end

  test "Should save" do
    category = Category.new
    category.name = "Movies"
    category.details = "Batman"
    user_id = 1
    assert category.save
  end

end


