require "test_helper"

class TaskTest < ActiveSupport::TestCase

  test "Should not save" do
    task = Task.new
    task.name = ""
    task.details = ""
    assert_not task.save
  end

  test "Should save" do
    task = Task.new
    task.name = "Grocery"
    task.details = "1L milk, 2 bananas"
    assert task.save
  end

end
