require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task1 = tasks(:one)
    @task2 = tasks(:two)
  end

  test "should get index" do
    get api_v1_tasks_url
    assert_not nil
    assert_equal(Task.all.count, JSON.parse(response.body).size) 
  end

  test "should create task" do
    assert_difference('Task.count') do
      post api_v1_tasks_url, params: { task: { isCompleted: @task1.isCompleted, isEditable: @task1.isEditable, name: @task1.name } }
    end
  end

  test "should update task" do
    patch api_v1_task_url(@task1), params: { task: { name: 'MyString1_updated' } }
    assert_equal("MyString1_updated", JSON.parse(response.body)["name"])
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete api_v1_task_url(@task1)
    end
  end

  test "should update task as editable" do
    put api_v1_task_is_editable_set_url(@task1), params: { task: { isEditable: @task1.isEditable } }
    assert_equal(true, JSON.parse(response.body)["isEditable"])
    put api_v1_task_is_editable_set_url(@task2), params: { task: { isEditable: @task2.isEditable } }
    assert_equal(true, JSON.parse(response.body)["isEditable"])
  end

  test "should toggle all tasks" do
    put api_v1_task_toggle_all_url(:toggleParam => true)
    assert_equal(JSON.parse(response.body)[0]["isCompleted"], true)
    assert_equal(JSON.parse(response.body)[0]["isCompleted"], true)
    
    put api_v1_task_toggle_all_url(:toggleParam => 0)
    assert_equal(JSON.parse(response.body)[0]["isCompleted"], false)
    assert_equal(JSON.parse(response.body)[1]["isCompleted"], false)
  end
end
