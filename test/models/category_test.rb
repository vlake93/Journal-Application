require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "Should not save" do
    category = Category.new
    category.name = ""
    category.details = ""
    assert_not category.save
  end

  test "Should save" do
    category = Category.new
    category.name = "Movies"
    category.details = "Batman"
    assert category.save
  end

end


