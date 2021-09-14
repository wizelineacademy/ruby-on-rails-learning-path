class Api::V1::PokemonController < ApplicationController

  POKEMON_SUPERTYPE = "Pokémon"

  @@cardsCache = {}

  def catch(size = 5)
    unless session[:user_id]
      return render json: {status: "error", code: 403, message: "not logged in"}
    end
    cards = []
    size.times do
      cards << catch_pokemon
    end
    trainer = get_pokemon_trainer session[:user_id]
    trainer.pokemon_cards << cards
    trainer.save
    render json: cards
  end

  def collection
    unless session[:user_id]
      return render json: {status: "error", code: 403, message: "not logged in"}
    end
    trainer = get_pokemon_trainer session[:user_id]
    p "Pokemon trainer cards: #{trainer.pokemon_cards.size}"
    render json: trainer.pokemon_cards
  end

  private

  def catch_pokemon
    # 1. Get all the sets
    # 2. Pick a random set
    # 3. From that set, pick a card number
    # 4. Search for the card via setid-cardnumber
    @@sets ||= Pokemon::Set.all

    randomCard = nil
    until randomCard
      randomSet = @@sets[rand(@@sets.size)]
      cardNumber = rand(randomSet.total) + 1
      randomCardId = "#{randomSet.id}-#{cardNumber}"
      randomCard = get_card_by_id(randomCardId)
      unless randomCard && (randomCard.supertype == POKEMON_SUPERTYPE)
        randomCard = nil
      end

      # If Uncommon or Rare, we will also randomize whether or not we will return it
      unless randomCard && (should_keep_based_on_rarity? randomCard.rarity.to_s)
        randomCard = nil
      end
    end
    randomCard
  end

  private

  def get_card_by_id(card_id)
    if @@cardsCache.has_key? card_id
      return @@cardsCache[card_id]
    end

    @@cardsCache[card_id] = PokemonCard.find_by_card_id card_id
    if(@@cardsCache[card_id])
      return @@cardsCache[card_id]
    end

    begin
      @@cardsCache[card_id] = convert_to_pokemon_card Pokemon::Card.find(card_id)
    rescue ArgumentError
      logger.warn "Cannot find card with ID: #{card_id}."
      @@cardsCache[card_id] = nil
    end
  end

  def convert_to_pokemon_card(card)
    PokemonCard.create!(:card_id => card.id, :name => card.name, :rarity => card.rarity, :supertype => card.supertype, :image_thumbnail => card.images.small,:image => card.images.large)
  end

  def should_keep_based_on_rarity?(rarity)
    if rarity.downcase.include? "common"
      return true
    elsif rarity.downcase.include? "rare"
      # 1 in 10 probability
      if rand(10) != 1
        return false
      end
    else
      #1 in 3 probability
      if rand(3) != 1
        return false
      end
    end
    return true
  end

  def get_pokemon_trainer(player_id)
    trainer = PokemonTrainer.find_by_player_id player_id
    unless trainer
      trainer = PokemonTrainer.new()
      trainer.player = Player.find player_id
      trainer.name = trainer.player.name || trainer.player.email
      trainer.pokemon_cards = []
      trainer.save
    end
    trainer
  end

end
