require "test_helper"

class MaestrosPokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pokemons_new_url
    assert_response :success
  end

  test "should get delete" do
    get pokemons_delete_url
    assert_response :success
  end

end