require "test_helper"

class StatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stats_index_url
    assert_response :success
  end

  test "should get show" do
    get stats_show_url
    assert_response :success
  end

  test "should get new" do
    get stats_new_url
    assert_response :success
  end

  test "should get edit" do
    get stats_edit_url
    assert_response :success
  end

  test "should get delete" do
    get stats_delete_url
    assert_response :success
  end
end
