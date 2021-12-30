require 'rake'
Rails.application.load_tasks

class PokemonController < ApplicationController
  def index
    render json: { pokemons: PokemonApi.to_json }
  end
end
