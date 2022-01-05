require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokemons_index_url
    assert_response :success
  end

  test "should get new" do
    get pokemons_new_url
    assert_response :success
  end

  test "should get edit" do
    get pokemons_edit_url
    assert_response :success
  end

  test "should get delete" do
    get pokemons_delete_url
    assert_response :success
  end
end
