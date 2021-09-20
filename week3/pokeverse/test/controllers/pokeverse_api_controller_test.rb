require "test_helper"

class PokeverseApiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokeverse_api_index_url
    assert_response :success
  end

  test "should get show" do
    get pokeverse_api_show_url
    assert_response :success
  end

  test "should get new" do
    get pokeverse_api_new_url
    assert_response :success
  end

  test "should get edit" do
    get pokeverse_api_edit_url
    assert_response :success
  end

  test "should get delete" do
    get pokeverse_api_delete_url
    assert_response :success
  end
end
