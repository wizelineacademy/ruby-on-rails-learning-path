class PokemonCardsController < ApplicationController
  
  layout 'user'

  before_action :confirm_logged_in

  def index
    @pokemon_cards = PokemonCard.where(:user_id => session[:user_id]).order("created_at ASC")
  end

  def show
    @pokemon_card = PokemonCard.find(params[:id])
  end

  def new
    @pokemon_card = PokemonCard.new(:defense => 2)
    @pokemon_card.pokemon = Pokemon.order(Arel.sql('RANDOM()')).first
    PokemonCard.number_of_moves.times { @pokemon_card.pokemon_card_moves << PokemonCardMove.create(:is_ability => false) }
    @pokemon_card.pokemon_card_moves << PokemonCardMove.create(:is_ability => true)
    @pokemon_card.user = User.find(session[:user_id])
    PokemonCard.number_of_tokens.times { @pokemon_card.pokemon_card_tokens << PokemonCardToken.create }
  end

  def create
    @pokemon_card = PokemonCard.new(:defense => pokemon_card_params_for_create[:defense].to_i)
    @pokemon_card.user = User.find(session[:user_id])
    @pokemon_card.pokemon = Pokemon.find(pokemon_card_params_for_create[:pokemon_id].to_i)
    
    pokemon_card_params_for_create[:pokemon_card_moves_attributes].each do |key, move|
      pcm = PokemonCardMove.create(
        :cost => move[:cost].to_i, 
        :description => move[:description],
        :is_ability => false)
      pcm.move = Move.find(move[:move_id].to_i)
      pcm.type = Type.find(move[:type_id].to_i)
      @pokemon_card.pokemon_card_moves << pcm
    end
    pca = PokemonCardMove.create(
      :is_ability => true,
      :description => pokemon_card_params_for_create[:pokemon_card_move][:description],
      :cost => 0
    )
    pca.move = Move.find(pokemon_card_params_for_create[:pokemon_card_move][:move_id].to_i)
    @pokemon_card.pokemon_card_moves << pca

    pokemon_card_params_for_create[:pokemon_card_tokens_attributes].each do |key, token|
      pct = PokemonCardToken.create
      pct.type = Type.find(token[:type_id].to_i)
      @pokemon_card.pokemon_card_tokens << pct
    end

    if @pokemon_card.save
      flash[:notice] = "Card created successfully."
      redirect_to(pokemon_cards_path)
    else
      render('new')
    end
  end

  def edit
    @pokemon_card = PokemonCard.find(params[:id])
  end

  def update
    @pokemon_card = PokemonCard.find(params[:id])
    @pokemon_card.defense = pokemon_card_params_for_create[:defense].to_i
    
    pokemon_card_params_for_create[:pokemon_card_moves_attributes].each do |key, move|
      pcm = PokemonCardMove.find(move[:id].to_i)
      unless pcm.is_ability
        pcm.cost = move[:cost].to_i
        pcm.description = move[:description]
        pcm.move = Move.find(move[:move_id].to_i)
        pcm.type = Type.find(move[:type_id].to_i)
        pcm.save
      end
    end
    pca = PokemonCardMove.find(pokemon_card_params_for_create[:pokemon_card_move][:id].to_i)
    pca.description = pokemon_card_params_for_create[:pokemon_card_move][:description]
    pca.move = Move.find(pokemon_card_params_for_create[:pokemon_card_move][:move_id].to_i)
    pca.save

    pokemon_card_params_for_create[:pokemon_card_tokens_attributes].each do |key, token|
      pct = PokemonCardToken.find(token[:id].to_i)
      pct.type = Type.find(token[:type_id].to_i)
      pct.save
    end

    if @pokemon_card.save
      flash[:notice] = "Pokemon card updated successfully."
      redirect_to(pokemon_card_path(@pokemon_card))
    else
      render('edit')
    end
  end

  def delete
    @pokemon_card = PokemonCard.find(params[:id])
  end

  def destroy
    @pokemon_card = PokemonCard.find(params[:id])
    @pokemon_card.destroy
    flash[:notice] = "Pokemon card destroyed successfully."
    redirect_to(pokemon_cards_path)
  end

  private

    def pokemon_card_params_for_create
      params.require(:pokemon_card)
        .permit(:pokemon_id, :defense,
          pokemon_card_moves_attributes: [:id, :move_id, :cost, :type_id, :description],
          pokemon_card_move: [:id, :move_id, :description],
          pokemon_card_tokens_attributes: [:id, :type_id])
    end
end
