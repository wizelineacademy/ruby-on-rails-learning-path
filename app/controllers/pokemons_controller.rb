# frozen_string_literal: true

# Class to show ALL pokemons from database, also show individual
class PokemonsController < ApplicationController
  before_action :authenticate_trainer!

  def index
    if params[:search]
      @pokemons = Pokemon.where('name LIKE ?', "%#{params[:search]}%")
      render file: "#{Rails.root}/public/404.html" if @pokemons.empty?
    else
      @pokemons = Pokemon.all
    end
  rescue StandardError => e
    print e
  end

  def show
    @pokemon = Pokemon.where(['name = ?', params[:id]])
    render file: "#{Rails.root}/public/404.html" if @pokemon.empty?
  rescue ActiveRecord::RecordNotFound => e
    print e
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def delete; end

  def destroy; end
end
