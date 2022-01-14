require 'test_helper'

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  test 'should get pokemons' do
    get pokemons_path
    assert_response :success
  end

  test 'should get pokemon' do
    get pokemon_path(id: 1)
    assert_response :success
  end

  test 'should get edit pokemon' do
    get edit_pokemon_path(id: 1)
    assert_response :success
  end

  test 'should get delete pokemon' do
    get delete_pokemon_path(id: 1)
    assert_response :success
  end

  test 'should get new pokemon' do
    get new_pokemon_path
    assert_response :success
  end
end
