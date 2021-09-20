require "test_helper"

class PokemonCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokemon_cards_index_url
    assert_response :success
  end

  test "should get show" do
    get pokemon_cards_show_url
    assert_response :success
  end

  test "should get new" do
    get pokemon_cards_new_url
    assert_response :success
  end

  test "should get edit" do
    get pokemon_cards_edit_url
    assert_response :success
  end

  test "should get delete" do
    get pokemon_cards_delete_url
    assert_response :success
  end
end
