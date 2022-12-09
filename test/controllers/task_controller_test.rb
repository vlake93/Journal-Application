require "test_helper"

class TaskControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_category_task_index_path
    assert_response :success
  end

  test "should get new" do
    get new_user_category_task_path
    assert_response :success
  end

  test "should create category" do
      post category_path, params: { task: { name: "Task", details: "Details", category_id: 1 } }
    end
end
