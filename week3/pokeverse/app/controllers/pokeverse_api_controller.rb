class PokeverseApiController < ActionController::API
  before_action :confirm_logged_in
  before_action :set_pokemon_card, only: [:show, :destroy]

  def index
    result_object = {
      pokemon_cards: []
    }
    pokemon_cards = PokemonCard.where(:user_id => session[:user_id]).order("created_at ASC")
    pokemon_cards.each do |pc|
      result_object[:pokemon_cards] << set_result_object(pc)
    end
    render json: result_object
  end

  def show
    render json: set_result_object(@pokemon_card)
  end

  def destroy
    @pokemon_card.destroy
    head :no_content
  end

  private

    def confirm_logged_in
      unless session[:user_id]
        redirect_to(access_login_path)
      end
    end
  
    def set_pokemon_card
      @pokemon_card = PokemonCard.where(:id => params[:id], :user_id => session[:user_id]).first
    end

    def set_result_object(pc)
      result_card = {
        id: pc.id,
        pokemon_id: pc.pokemon.pokeapi_id,
        pokemon_name: pc.pokemon.name,
        defense: pc.defense,
        tokens: [
          pc.pokemon_card_tokens[0].type.color,
          pc.pokemon_card_tokens[1].type.color
        ],
        moves: []
      }
      pc.pokemon_card_moves.each do |pcm|
        unless pcm.is_ability
          result_card[:moves] << {name: pcm.move.name, description: pcm.description, cost: pcm.cost, type: pcm.type.color}
        else
          result_card.store(:ability, {name: pcm.move.name, description: pcm.description})
        end
      end
      result_card
    end
end
