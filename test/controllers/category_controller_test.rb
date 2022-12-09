require "test_helper"

class CategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_category_index_path
    assert_response :success
  end

  test "should get new" do
    get new_user_category_path
    assert_response :success
  end

  test "should create category" do
      post category_path, params: { category: { name: "Category", details: "Details", user_id: 1 } }
    end

end
